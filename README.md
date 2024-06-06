![Futhark logo](https://github.com/PMunch/futhark/blob/master/futhark.png)

Have your eyes set on the perfect C library for your project? Can't find a
wrapper for it in Nim? Look no further! Futhark aims to allow you to simply
import C header files directly into Nim, and allow you to use them like you
would from C without any manual intervention. It's still in a beta state, but it
already wraps most header files without any rewrites or pre-processing and has
successfully been used to wrap complex projects.

```nim
import futhark

# Tell futhark where to find the C libraries you will compile with, and what
# header files you wish to import.
importc:
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

## Basic usage
A lot of people coming from other wrapping tools start out a bit confused about
Futhark. With other tools it is common to wrap things into a Nim module first,
then import that module into your program. This is not the way Futhark is
supposed to be used. With Futhark you handle your C imports in the `importc`
block and just import the module in which you have that block. This is to ensure
that all defines, configurations, and platform specific things will match up
between your code and the C code. It is however possible to use Futhark to
generate a wrapper, this is detailed in the "Shipping wrappers" section of this
README.

The four main things you need to know to use Futhark is `sysPath`, `path`,
`compilerArgs`, and normal imports (the `"stb_image.h"` part in the above
example).
- `sysPath` denotes system paths, these will be passed to Øpir to make sure
  Clang knows where to find all the definitions. This can also be passed with
  `-d:sysPath:<path 1>:<path 2>` if you want to automatically generate these. By
  default Futhark tries to find the `sysPath` automatically and you don't need
  to specify this yourself.
- `path` denotes library paths, these will also be passed to Øpir, but anything
  found in these files which is used by anything in the explicitly imported
  files will be wrapped by Futhark as well.
- `compilerArgs` specifies additional flags that should be passed to Clang
  when parsing the C headers.
- Files listed in quotes in the importc are equivalent to `#include "file.h"`
  in C. Futhark will generate all definitions in these files, and if `file.h`
  imports more files found in any of the paths passed in by `path` these files
  will also be imported.

Note: The difference between `sysPath` and `path` is simply about how Futhark
handles definitions found in these paths. `sysPath` are paths which are fed to
Øpir and Clang in order to make Clang able to read all the types. `path` are
the paths Futhark takes into account when generating definitions. This
difference exists to make sure Futhark doesn't import all kinds of low-level
system stuff which is already available in Nim. A subpath of `sysPath` can be
passed in with `path` without trouble. So `sysPath "/usr/include"` followed by
`path "/usr/include/X11"` is fine and Futhark will only generate code for the
explicitly mentioned files, and any files it requires from `/usr/include/X11`.

## Hard names and overrides
Nim, unlike C, is case and underscore insensitive and doesn't allow you to have
identifiers starting with `_` or `__`, or identifiers that have more than one
consecutive `_` in them. Nim also has a set of reserved keywords like `proc`,
`addr`, and `type` which would be inconvenient to have as names. Because of
this Futhark will rename these according to some fairly simple rules.

| Name issue       | Nim rename                                          |
| ---------------- | --------------------------------------------------- |
| struct type      | `struct_` prefix                                    |
| union type       | `union_` prefix                                     |
| enum type        | `enum_` prefix                                      |
| `_` prefix       | `internal` prefix                                   |
| `__` prefix      | `compiler` prefix                                   |
| `__` in name     | All underscores removed                             |
| Reserved keyword | Append kind to name, `proc`, `const`, `struct` etc. |

Since this, along with Nims style-insensitivity, means that some identifiers
might still collide, the name will further have the kind appended, and if it
still collides it will append the hash of the original identifier. This
shouldn't happen often in real projects and exists mostly to create a foolproof
renaming scheme. Note that struct and union types also get a prefix, this is
normally resolved automatically by C typedef-ing the `struct struct_name` to
`struct_name_t`, but in case you need to use a `struct struct_name` type just
keep in mind that in Nim it will be `struct_struct_name`.

If you want to rename an object or a field you can use the `rename` directive.
Simply put `rename <from>, <to>` along with your other options. `<from>` can be
either just an object name (before any other renaming) as a string or ident, or
a field in the format `<object>.<field>` both the original C names either as
two identifiers, or the whole thing as a single string. `<to>` is always a
single identifier and is the new name.

If you want to implement more complex renaming you can use the `renameCallback`
directive and pass in a callback function that takes the original name, a
string denoting what kind of identifier this is, and an optional string
denoting which object or procedure this identifier occurs in, and which returns
a new string. This callback will be inserted into the renaming logic and will
be called on the original C identifier before all the other rules are applied.

## Redefining types
C tends to use a lot of void pointers, pointers to characters, and pointers to
a single element which is supposed to be a collection of said element. In Nim
we like to be a bit more strict about our types. For this you can use the
`retype` directive. It takes the form `retype <object>.<field>, <Nim type>` so
for example to retype the C array type defined as `some_element* some_field` to
an indexable type in Nim you can use
`retype some_object.some_field, ptr UncheckedArray[some_element]`. The names
for the object and field are both their renamed Nim identifiers.

If you need to redefine an entire object, instead of just specific fields
Futhark by default also guards every type and procedure definiton in simple
`when declared(SomeType)` statements so that if you want to override a
definition you can simply define your type before the `importc` macro
invocation and Futhark won't override your definition. It is up to you however
to ensure that this type actually matches in size and layout with the original
C type.

## Compatibility features and readability
Futhark by default tries to ensure the highest amount of compatibility with
pre-wrapped libraries (e.g. the `posix` standard library module) and other user
code. Because of this the output which Futhark generates isn't very pretty,
being littered with `when defined` statements and weird numbered
identifiers for renaming things. These features are intended to make Futhark
easier to use in a mostly automatic fashion, but you might not need them. If
you want to read the generated output, build documentation of a Futhark
generated module, or possibly get an improved editor experience you might want
to disable some of these features for a prettier, more readable output.

There are basically three things you can control with define switches:

| Define        | Effect                                                      |
| ------------- | ----------------------------------------------------------- |
| nodeclguards  | Disables the object rename/override functionality           |
| noopaquetypes | Disables opaque types used for unknown objects              |
| exportall     | Exports all fields (including renamed ones)                 |

### Object rename/override functionality
This declares types in such a way that earlier declarations by the same name
will not be overriden or collide. With this feature you can declare an object,
function, enum, etc. before the call to Futhark and these declarations will be
used instead of the auto-generated ones. This is also what enables the feature
at the end of the "Redifining types" section. Disabling this feature will
remove all of the `when declared` but you might run into Futhark trying to
redeclare existing things, including built in types and names.

### Opaque type functionality
If a type is not fully declared in your C headers but is still required for
your project Futhark will generate a `type SomeType = object` dummy
type for it. Since most C libraries will pass things by pointer this makes sure
that a `ptr SomeType` can exist and be passed around without having to know
anything about `SomeType`. Disabling this feature will remove these definitions
but might mean some procedure definitions now have invalid parameters or return
types. This is mostly useful in conjunction with `nodeclguards` and manually
declaring these types.

### Hiding symbols functionality
To avoid editors showing the renamed identifiers used by the object
rename/override functionality they are hidden by default. If however you want
to generate documentation for a Futhark generated module these fields won't be
visible and the documentation mostly useless. With `exportall` these symbols
will be exported as well and documentation will be readable. This is mostly
useful if you want to export documentation but can't use `nodeclguards` (which
makes even more readable documentation).

## Inline functions
When using Futhark with dynamic libraries it doesn't make sense to wrap inline
functions. However if you are compiling your code directly against some C code
these might be useful to you. In this case you can pass `-d:generateInline` to
generate function definitions for inline functions.

## Pre-ANSI C function declarations
Also known as K&R style functions. By definition C code like
```c
int* myfunc();
```
is a pre-ansi C function declaration that says `myfunc` returns a pointer to an
integer *and takes any number of arguments*. This last part is a historic thing
you can read more about [here](https://jameshfisher.com/2016/11/27/c-k-and-r/),
but suffice to say this is misused in quite a lot of C libraries to mean that
the function takes no arguments. Since this is fairly obscure, and Nim will
create bad C code if the varargs pragma is attached to a function without
arguments this is ignored by default. However if you for some reason require
this you might add `-d:preAnsiFuncDecl` while compiling.

## Deeper control
### Rename callback
If you want to rename identifiers, for example removing common prefixes,
postfixes, or other similar things you can use a rename callback. This can be
defined by adding `renameCallback <procedure name>` to your `importc` block. The
signature of the callback is:
```
proc(name: string, kind: string, partof = ""): string
```
where `name` is the original name as present in the C code, `kind` is the kind
of the identifier such as "enum", "proc", "arg", "field", etc. The argument
`partof` is only used for field names in a structure.

Please note that in order to avoid name collisions the normal anti-collision
transformations are done after the rename callback.

### Øpir callbacks
In case you face issues that aren't easily solveable there is one last option
for making modifications, and this is Øpir hooks. Since Øpir converts your C
imports to a JSON format you're able to register hooks that will be run before
Futhark consumes this JSON. These are simple procedures which takes a `JsonNode`
and returns a `JsonNode`. With this you're able to change every aspect of the
JSON, and even add or remove definitions. The callbacks are a list, so modules
to perform certain commonly done transformations (e.g. combine similarly named
constants into an enum) could be added to the list of callbacks easily. To add
these simply add in `addOpirCallback <procedure name>` to your `importc` block.

## Destructors
If you are using a C library you will probably want to wrap destructor calls.
Futhark makes all C objects `{.pure, inheritable.}` which means you can quite
easily use somewhat idiomatic Nim to achieve destructors.

An example usecase from MiniAudio bindings is as follows:
```nim
type TAudioEngine = object of maEngine # Creates a new object in this scope
                                       # maEngine is a type wrapped by Futhark
                                       # TAudioEngine can now have a destructor
                                       # attached to it

proc `=destroy`(engine: var TAudioEngine) = # Define a destructor as normal
  maEngineUninit(engine.addr)
```

## Dynamic libraries and implementing headers
If you are making a dynamic or static library to be loaded or linked with
another program you are often given a header file to implement. This file
typically includes the types and functions you are able to call from the main
program, along with the procedures that your application has to implement in
order to be loaded and run correctly. Futhark normally imports all headers on
the assumption that things will be made available from C while compiling, ie.
it adds the `importc` pragma to them. But in order to support this scenario you
can also get it to create forward declarations with the `exportc` pragma. This
allows Nim to know that there has to exist an implementation for a given
procedure in your application, and as such will fail to compile if you're
missing an implementation. It will also make sure that your signature is
exported correctly and matches the intended C header. To do this simply define
the procedures to be forward declared like this along with your other options:

```nim
importc:
  forward "proc_to_forward"
```

Futark will automatically add the `dynlib` pragma to this declaration if you're
buildin with `--app:lib`, but if you need to add more pragmas you can list them
after the name like so:

```nim
macro customPragma(msg: static[string], body: untyped): untyped =
  echo "Saying: ", msg
  return body

importc:
  forward "proc_to_forward", customPragma("Hello world"), used
```

If you want to see what code Futhark generated for your forward declarations,
and therefore the signature you need to match (even the argument names), you
can pass `-d:echoForwards` and they will be written out in the terminal while
compiling.

NOTE: Since the forward declaration has all the pragmas for passing it on as C
compatible symbols you don't actually need to have these pragmas attached to
your implementation which makes it a bit cleaner. And the procedure can of
course be written in camelCase if you prefer, it will still match the forward
declaration.

# Shipping wrappers
You've built wrappers with Futhark, expanded them with a nice Nim interface and
it's time to share them with the world! This section will give some
best-practices on how to ship wrappers. Since the Øpir tool requires Clang to
be installed it can be a bit tricky to get Futhark installed. In addition to
this Futhark obviously requires access to the C header files, which might be
installed in different places based on the system. Because of these things you
might not want to have Futhark as a dependency for your bindings. To help with
this Futhark has an `outputPath` argument which can be added to the `importc`
block. This path is where the completed bindings will be stored, and also where
Futhark will look for existing bindings to avoid rebuilding them. This means
that with the `outputPath` set to a file you will need to use
`-d:futharkRebuild` to update the file when you make changes in the `importc`
block. If you set `outputPath` to a folder then `futhark` will store the files
with the appended hash in this folder instead of in the `nimcache` folder and
caching will work as usual. By using this feature you will be able to set a
path local to your project and check the generated Futhark file into your
version control system. But that is only half the job, because to be aware of
the cache file Futhark still needs to be installed. The recommended way to get
around this is to do a `when defined(useFuthark)` switch to check whether the
user wants to use Futhark directly or to use the shipped wrapper. It is
recommended to use the exact name `useFuthark`, this way the user can turn on
Futhark for the entire project (in case you have imported another library which
also uses Futhark). If you want to give the user the option to switch on
Futhark for only your project it is recommended to use an additional switch
with `useFutharkFor<project name>`.

A complete sample would look a bit something like this:

```nim
when defined(useFuthark) or defined(useFutharkForExample):
  import futhark, os

  importc:
    outputPath currentSourcePath.parentDir / "generated.nim"
    path "<path to library>"
    "libfile.h"
else:
  include "generated.nim"
```

Keep in mind that when your package is installed the generated Futhark output
would be placed in the folder of your package using this code. If the
`/ "generated.nim"` part is left of then the file would be named
`futhark_<hash>.nim` as described above, this means that your `include` could
use the one specified in your package installation, while users doing
`useFuthark` would generate one based on its hash (or reuse yours if the hash
matches).

## Project mode
Futhark is best used when it is allowed to see the C files while compiling. This
allows it to make sure that all platform specific stuff matches up perfectly.
However this is not always possible, or for whatever other reason wanted. One
scenario where this is the case is for embedded projects. The Futhark macro
doesn't work when targeting platforms without proper OS support, so using it the
recommended way is simply not possible.

Because of this it is also possible to use Futhark in "project mode". In project
mode you simply don't specify any files to import. Instead you only specify
which `path`'s you want to search. Futhark will then recreate the original
folder structure of the header files it finds and generate Nim files in their
place. These try to properly import and export each other so the behaviour is as
similar to C and if Futhark finds `.c` files next to the `.h` files of the same
name it also adds `{.passL:"-I<path>".}` and `{.compile: "<file>".}` pragmas to
automatically import and compile the required C files. This means that a
separate dummy wrapper project can be set up which just generates this folder
structure, and the main project can simply import files from this folder as if
they where normal modules.

While this is quite a nice feature it isn't as bullet-proof as the traditional
way to use Futhark. It might require some pre-processing of the C project, and
it often means more work with getting everything compiled properly. But when
normal Futhark usage isn't possible or desired this is a decent option.

To minimize the pre-processing burden this mode also adds a new option `ignore`
to the `importc` block. This is simply a file or folder to ignore while
traversing the given paths. Futhark will not try to generate any input for this
file/folder, but it will look at the headers inside to resolve other parts of
the project. This is mainly useful if you have folders with examples or other
code you're not actually supposed to import.

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
Futhark is currently in an beta state, it works really well but you might run
into occasional bugs or hickups. It also doesn't support C++ at the moment, and
it doesn't understand things like function-style macros. It might also mess up
on strange C things which haven't been encountered yet, although this is more
and more rare as people use it. All of these shortcomings are things I hope to
get fixed up over time.

# Installation
To install Futhark you first need to have clang installed. Installing clang on
Linux is as simple as just grabbing it from your package manager (e.g. `sudo
apt install clang libclang-dev`). To install clang on Windows you need to install
[LLVM](https://github.com/llvm/llvm-project/releases/tag/llvmorg-15.0.7) (you
probably want to grab the `LLVM-15.0.7-win64.exe` version). To install clang on
macOS, run `xcode-select --install` in the terminal. Opir should then detect
it automatically. Have a look at [opir.nims](src/opir.nims) if you're
curious how the Windows and macOS detection works.

If you have Clang installed in your system path you can now simply run:
```
nimble install futhark
```

Otherwise you need to tell Opir how to link with libclang. Do this by either
copying the `libclang.lib` and `libclang.dll` into the Futhark project dir or
use `passL` to pass the folder that `libclang.lib` (or libclang.so on Linux
machines) lives in to the linker:

```
nimble install --passL:"-L<path to lib directory containing libclang.so file>" futhark
#e.g.: nimble install --passL:"-L/usr/lib/llvm-6.0/lib" futhark
```

# Known wrappers made with Futhark
By the nature of Futhark wrappers can be made on the fly for a specific project.
I've wrapped many large C projects with Futhark, but just for use in specific,
and sometimes proprietary, codebases. That being said this list contains
wrappers that are made with Futhark which have been published in some shape or
form. These can very from just a simple file with some Futhark instructions, to
full projects that add nice-to-have features on top of an existing C library. If
you have a project of your own you want to show off, please make a PR!

- [MAPM](https://github.com/PMunch/mapm-nim): Fully wrapped with destructors and a nice Nim interface
- [libfuse](https://github.com/PMunch/libfuse-nim/blob/master/libfuse.nim): Quick and dirty wrapper for libfuse to play around with filesystems
- [VapourSynth](https://github.com/mantielero/vs.nim): Uses Futhark to create the initial wrapper, then builds a nice Nim library on top
- [python_nim_libmem](https://github.com/Hypnootika/python_nim_libmem): Futhark and helper scripts to generate Nim and Python bindings for "Libmem"

## TODO
- Proper handling of C macros (inherently hard because C macros are typeless)
- Find way to not require C compiler include paths
