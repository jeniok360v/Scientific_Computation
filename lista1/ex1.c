#Yauheni Tsyrkunovich
#include <float.h>
#include <stdio.h>

int main()
{
    printf("epsilon maszynowe dla float (Julia: Float32):\n %.32f\n", FLT_EPSILON);
    printf("epsilon maszynowe dla double(Julia: Float64):\n %.64f\n", DBL_EPSILON);
    return 0;
}
