/**
 * in this exercise, i give a usecase that compile C source file without
 * startup.S.
 * i just want to test that startup.S is unnecessary for compile.
 * by the way, i will understand C language is based on some basic data
 * structure, like stack.
 * besides, i use riscv-none-embed-objdump command to find other Secitons
 * which are C source file denpendent on.
 * in this way, i can add secitons manually that find in main.c.o object file
 * through follows command:
 * riscv-none-embed-objdump -h main.c.o
 */

/**
 * to finish the mission, run code ,and watch program how to run.
 * i make a common bug that almost most people will meet the problem called
 * stack overflow.
 */
int sum(char a[], int n) {
  int s = 0;
  for (int i = 0; i < n; i++) {
    s += a[i];
  }
  return s;
}

int main(void) {
  int i = 0;
  const char data[10] = {1, 2, 3, 4, 5, 6, 7, 8, 9, 10};
  char buffer[10] = {0};
  for (i = 0; i < 10; i++) {
    buffer[i] = data[i];
  }
  sum(buffer, 10);
  return 0;
}