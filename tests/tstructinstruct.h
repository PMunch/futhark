struct Child {
  int field1;
  char *field2;
};

struct Parent {
  int field1;
  struct Child* child;
  float field2;
};

struct Normal {
  struct ForwardDeclared* field1;
};
