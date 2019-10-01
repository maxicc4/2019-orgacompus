#include <stdio.h>

// Imprime una matriz unitaria de n*n
int main() {
	int n = 50;
	for (int y=0; y < n; y++) {
		for (int x=0; x < n; x++) {
			if (x == y) {
				printf("1 ");
			} else {
				printf("0 ");
			}
		}
	}
}