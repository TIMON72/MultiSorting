chan STDIN // Поток ввода в консоли
#define SIZE 16 // Размерность массива
int array[SIZE], sort1[SIZE], sort2[SIZE], sort3[SIZE] // Массивы
// Сортировка пузырьком
proctype Sort1() {
    printf("Sort1 running\n")
    int i, j, temp
    for (i : 1 .. SIZE - 1) {
        for (j : 0 .. SIZE - i - 1) {
            if
            :: sort1[j] > sort1[j + 1] ->
                temp = sort1[j]
                sort1[j] = sort1[j + 1]
                sort1[j + 1] = temp
            :: else ->
                skip
            fi
        }
    }
    // for (i : 0 .. SIZE - 1) {
    //     printf("sort1[%d] = %d ", i, sort1[i])
    // }
}
// Сортировка вставками
proctype Sort2() {
    printf("Sort2 running\n")
    int i, temp
    for (i : 1 .. SIZE - 1) {
        temp = sort2[i]
        int j = i
        do
        ::  if
            :: j > 0 && temp < sort2[j - 1] ->
                sort2[j] = sort2[j - 1]
                j--
            :: else ->
                break
            fi
            sort2[j] = temp
        od
    }
    // for (i : 0 .. SIZE - 1) {
    //     printf("sort2[%d] = %d ", i, sort2[i])
    // }
}
// Сортировка Шелла
proctype Sort3() {
    printf("Sort3 running\n")
    int i, j, temp
    int step = SIZE / 2
    do
    ::  if
        :: step > 0 ->
            for (i : 0 .. SIZE - 1 - step) {
                j = i
                do
                ::  if
                    :: j >= 0 && sort3[j] > sort3[j + step] ->
                        temp = sort3[j]
                        sort3[j] = sort3[j + step]
                        sort3[j + step] = temp
                        j = j - step
                    :: else ->
                        break
                    fi
                od
            }
            step = step / 2
        :: else ->
            break
        fi
    od
    // for (i : 0 .. SIZE - 1) {
    //     printf("sort3[%d] = %d ", i, sort3[i])
    // }
}
// Инициализирующий процесс
init {
    int c
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
        fi
    od
    // Копирование массива в переменные для сортировки
    for (i : 0 .. SIZE - 1) {
        sort1[i] = array[i]
        sort2[i] = array[i]
        sort3[i] = array[i]
    }
    // Запуск сортировок
    atomic {
        run Sort1()
        run Sort2()
        run Sort3()
    }
}