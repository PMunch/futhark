![Futhark logo](https://github.com/PMunch/futhark/blob/master/futhark.png)

Have your eyes set on the perfect C library for your project? Can't find a
wrapper for it in Nim? Look no further! Futhark aims to allow you to simply
import C header files directly into Nim, and allow you to use them like you
would from C without any manual intervention. It's still in an alpha state, but
it can already wrap many complex header files without any rewrites or
pre-processing.

```nim
import futhark

# Tell futhark where to find the C libraries you will compile with, and what
# header files you wish to import.
importc:
  absPath "/usr/lib/clang/12.0.1/include"
  path "../stb"
  define STB_IMAGE_IMPLEMENTATION
  "stb_image.h"

# Tell Nim how to compile against the library. If you have a dynamic library
# this would simply be a `--passL:"-l<library name>`
static:
  writeFile("test.c", """
  #define STB_IMAGE_IMPLEMENTATION
  #include "../stb/stb_image.h"
  """)
{.compile: "test.c".}

# Use the library just like you would in C!
var width, height, channels: cint

var image = stbi_load("futhark.png", width.addr, height.addr, channels.addr, STBI_default.cint)
if image == nil:
  echo "Error in loading the image"
  quit 1

echo "Loaded image with a width of ", width, ", a height of ", height, " and ", channels, " channels"
stbi_image_free(image)
```

# So are all C wrappers now obsolete?
Not quite. Futhark only tells you what the C headers define and allows you to
use them. This means that the interface is still very C-like. A lot of great
Nim wrappers will take a C library and wrap it into something that is a little
more simple to use from Nim land. But Futhark can definitely be used to help
with wrapping C libraries. Since it reads the C files directly you are
guaranteed that all the types match up with their C counterparts, no matter
what platform you're on, or what defines you want to pass. This is a huge
benefit over hand-wrapped code. Futhark and Øpir will also cache their results,
so after the initial compilation it's just as fast to use as it simply grabs
the pre-generated Nim file from the cache. Both files could of course also be
edited or included as-is in a project if you want users to not have to run Øpir
or Futhark themselves.

# How does it work?
Basically Futhark comprises of two parts, a helper program called Øpir (or
`opir` just to ensure that it works everywhere) and a module called `futhark`
that exposes a `importc` macro. Øpir is compiled with libclang and uses Clang
to parse and understand the C files, it then creates a big JSON output of
everything that is defined in the headers with Nim friendly types. The macro
then reads this file and applies any overrides to types and names before it
generates all the Nim definitions.

## Hard names and overrides
Nim, unlike C, is case and underscore insensitive and doesn't allow you to have
identifiers starting with `_` or `__`, or identifiers that have more than one
consecutive `_` in them. Nim also has a set of reserved keywords like `proc`,
`addr`, and `type` which would be inconvenient to have as names. Because of
this Futhark will rename these according to some fairly simple rules.

| Name issue       | Nim rename                                          |
| ---------------- | --------------------------------------------------- |
| `_` prefix       | `internal` prefix                                   |
| `__` prefix      | `compiler` prefix                                   |
| `__` in name     | All underscores removed                             |
| Reserved keyword | Append kind to name, `proc`, `const`, `struct` etc. |

Since this, along with Nims style-insensitivity means that some identifiers
might collide the name will then further have the kind appended, and if it still
collides it will append the hash of the original identifier. This shouldn't
happen often in real projects and exists mostly to create a foolproof renaming
scheme.

If you want to rename an object or a field you can use the `rename` directive.
Simply put `rename <from>, <to>` along with your other options. `<from>` can be
either just an object name (after renaming), or a field in the format
`<object>.<field>`. `<to>` is always a single identifier and is the new name.

## Redefining types
C tends to use a lot of void pointers, pointers to characters, and pointers to
a single element which is supposed to be a collection of said element. In Nim
we like to be a bit more strict about our types. For this you can use the
`retype` directive. It takes the form `retype <object>.<field>, <Nim type>` so
for example to retype a `some_element* some_field` to an indexable type in Nim
you can use `retype some_object.some_field, ptr UncheckedArray[some_element]`.
If a type is not defined in your C headers but is still required for your
project Futhark will generate a `type SomeType = distinct object` dummy type
for it. Since most C libraries will pass things by pointer this makes sure that
a `ptr SomeType` can exist and be passed around without having to know anything
about `SomeType`. Futhark also gates every type and procedure definiton in
simple `when declared(SomeType)` statements so that if you want to override a
definition you can simply define your type before the `importc` macro
invocation and Futhark won't override your definition but simply use the one
you specified. It is up to you however to ensure that this type actually
matches in size and layout with the original C type.

# But why not use c2nim or nimterop?
Both c2nim and nimterop have failed me in the past when wrapping headers. This
boils down to how they are built. c2nim tries to read and understand C files
on its own, something which might appear simple, but C is notoriously hard to
parse and c2nim fails on macros and other slightly complex things. nimterop
uses treesitter and performs slightly better. It is theoretically able to parse
all C syntax, but the C semantics is still up to nimterop to implement. Which
means it can't do macros or things like IFDEF automatically.

Futhark on the other hand uses clang, which is very good at both understand C
syntax, but also C semantics. This means that it resolves all macros and IFDEF
statements, and just gives us the definitions for everything. This means much
less work in actually trying to understand C, which means that all this work
can be spent on quality Nim translation.

# Sounds great, what's the catch?
Futhark is currently in an alpha state. It currently doesn't support C++, and
it doesn't understand things like function-style macros. It might also mess up
on definition types I haven't seen yet in the small handful of libraries I've
tested it against. All of these things are things I hope to get fixed up.

## TODO
- Proper handling of C macros (inherently hard because C macros are typeless)
- Find way to not require C compiler include paths
- Verify if/make it work on Windows and Mac
