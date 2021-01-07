chan STDIN
#define SIZE 16
chan buffer = [SIZE] of { int }
int array[SIZE]


proctype Sort1() {
    printf("Sort1 running\n")
    //int array[SIZE]
    //buffer ? array
    int i

    //int temp
    //buffer ? temp
    //printf("temp = %d\n", temp)
    for (i : 0 .. SIZE - 1) {
        //buffer ? array[i]
        printf("array1[%d] = %d ", i, array[i])
    }
}

proctype Sort2() {
    printf("Sort2 running\n")
    //int array[SIZE]
    int i
    for (i : 0 .. SIZE - 1) {
        //buffer ? array[i]
        printf("array2[%d] = %d ", i, array[i])
    }
}

// active proctype Main() {   
//     int array
//     STDIN ? array
//     //Sinp ? array
//     printf("IN = \t%d\n", array)
//     buffer ! array
//     run P()
// }

init {
    int c
    //int array[SIZE]
    int i = 0
    int sign = 1
    printf("Enter array (size <= 16): ")
    do
    :: STDIN ? c ->
        if
        :: c == '-' -> 
            sign = -1
        :: c == '0' ->
            array[i] = array[i] * 10 + sign * 0
        :: c == '1' ->
            array[i] = array[i] * 10 + sign * 1
        :: c == '2' ->
            array[i] = array[i] * 10 + sign * 2
        :: c == '3' ->
            array[i] = array[i] * 10 + sign * 3
        :: c == '4' ->
            array[i] = array[i] * 10 + sign * 4
        :: c == '5' ->
            array[i] = array[i] * 10 + sign * 5
        :: c == '6' ->
            array[i] = array[i] * 10 + sign * 6
        :: c == '7' ->
            array[i] = array[i] * 10 + sign * 7
        :: c == '8' ->
            array[i] = array[i] * 10 + sign * 8
        :: c == '9' ->
            array[i] = array[i] * 10 + sign * 9
        :: c == ' ' ->
            sign = 1
            i++
        :: c == '\n' -> 
            break
        :: else -> skip
        fi;
    od;
    // for (i : 0 .. SIZE - 1) {
    //     buffer ! array[i]
    // }
    printf("read: %d %d\n", array[0], array[1])
    atomic {
        run Sort1()
        run Sort2()
    }
}