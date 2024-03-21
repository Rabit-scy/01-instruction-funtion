int sum_0(void);
int sum_double(int a);
int sum_2(int a, int b);
int sum_3(int a, int b, int c);
/*
  no reference,linker will discard them.
*/
int my_data[] = {0x11223344, 0x88776655, 0xccbbaa99};

int main(void) {
  int i = 0;
  int sum[] = {0, 0, 0, 0};

  sum[0] = sum_0();
  sum[0] = sum_0();
  sum[0] = sum_0();
  i = sum[0] + 1;
  sum[1] = sum_double(i);
  i = 5;
  sum[2] = sum_2(sum[1], i + 1);
  sum[3] = sum_3(sum[0], sum[1], sum[2]);

  return sum[3];
}

int sum_0(void) {
  static int c = 0;
  return c++;
}
int sum_double(int a) {
  static int c = 0;
  c = c + a;

  return c;
}
int sum_2(int a, int b) { return (a + b) / 2; }
int sum_3(int a, int b, int c) { return (a + b + c) / 3; }

asm volatile {}
