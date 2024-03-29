min(X, Y, X):- % Если X < Y, возвращаем X
    X < Y,!.
min(_, Y, Y). % Иначе возвразаем Y

del_first(X, [X|Tail], Tail):- !. % Если нашли эл-т удаляем
del_first(X, [Y|Tail], [Y|Tail2]):- % Иначе, добавляем текущий эл-т в ответ и крутим списко дальше
    del_first(X, Tail,Tail2).

find_min([], inf). % Пустой список имеет минимальный эл-т равный положительной бесконечности
find_min([X| Tail], Min):- % Ищем минимум хвоста и сравниваем его с текущим, возвращаем меньший
    find_min(Tail, Min1),
    min(Min1, X, Min).
    
selection_sort([], []). % Если передали пустой список
selection_sort([X], [X]). % Если список из одного эл-та, то он отсортированн
selection_sort(Set, [X|Tail2]):- % Ищем минимум списка, добавляем его в голову ответа, удаляем из первоначального, и продолжаем сортировку нового списка
    find_min(Set, X),
    del_first(X, Set, Set1),
    selection_sort(Set1, Tail2).

    
