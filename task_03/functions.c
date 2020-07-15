#include "functions.h"

U64 factorial(U64 n)
{
	U64 nr = 1;
	for (int c = 1; c <= n; c++)
		nr *= c;
	return nr;
}

U64 base_convert(U64 n, U64 b) {
	U64 nr = 0;
	unsigned int rem, i = 1, step = 1;
	while (n != 0) {
		rem = n % b;
		n /= b;
		nr += rem * i;
		i *= 10;
	}
	return nr;
}

U64 power(U64 n, U64 e) {
	U64 nr = 1;
	while(e-- > 0)
		nr *= n;
	return nr;
}
