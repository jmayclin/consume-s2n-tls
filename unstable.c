#include "s2n.h"
#include "fingerprint.h"

int main() {
    int result = s2n_init();
    printf("the result of s2n_init is %d\n", result);
}