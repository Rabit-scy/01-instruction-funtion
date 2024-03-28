/**
 * @file main.c
 * @author your name (you@domain.com)
 * @brief   see quick_sort call sequences and stack frame.
 * @version 0.1
 * @date 2024-03-28
 *
 * @copyright Copyright (c) 2024
 *
 */

int need_to_sort[11] = {10, 30, 20, 33, 22, 11, 5, 8, 13, 28, 3};

void swap(int *a, int *b) {
  int x;

  x = *a;
  *a = *b;
  *b = *a;
}
void QuickSort(int low, int high) {
  int i = low;
  int j = high;
  if (i >= j) {
    return;
  }

  int temp = need_to_sort[low];
  while (i != j) {
    while (need_to_sort[j] >= temp && i < j) {
      j--;
    }
    while (need_to_sort[i] <= temp && i < j) {
      i++;
    }
    if (i < j) {
      swap(&need_to_sort[i], &need_to_sort[j]);
    }
  }

  swap(&need_to_sort[low], &need_to_sort[i]);
  QuickSort(low, i - 1);
  QuickSort(i + 1, high);
}

int main(void) {
  QuickSort(0, 11);
  return 0;
}