typedef int type;
typedef int proc;
typedef int set;

struct illegal {
  int type;
  int proc;
  int set;
};

int func(int *end);
void typedesc(int *end, int proc);
