// must include "s2n.h"
// cmake will complain if you try and include "api/s2n.h"
#include "s2n.h"

int main() {
    int result = s2n_init();
    printf("the result of s2n_init is %d\n", result);
}