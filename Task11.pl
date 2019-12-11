len([],0). % Если передан пустой список
len([_| Tail], A):- % Рекурсивно считаем длинну: считаем длинну хвоста, прибавляем один и возвращаем ответ (тормозим в 1 предикате)
    len(Tail, A1),
    A is A1 + 1.

start([], _, []). % Если передан пустой список
start(A, 0, A). % Если сдвиг на 0
start(Set, Sdvig, A):- % Если нужно сдвиг назад
    Sdvig < 0, !,
    len(Set, L),
    Idx is abs(Sdvig) mod L,
    Idx =\= 0, !,
    sdvig(Set, Idx, A).

start(Set, Sdvig, A):- % Если нужно сдвиг вперед
    Sdvig > 0, 
    len(Set, L),
    Idx is abs(Sdvig) mod L,
    Idx =\= 0, !,
    Idx1 is L - Idx, 
    sdvig(Set, Idx1, A).

start(Set, Sdvig, Set):- % Если сдвиг кратен длинне
    len(Set, L),
    Idx is abs(Sdvig) mod L,
    Idx =:= 0.

sdvig(Set, Idx, A):- % Получаем список после нужного индекса, затем получаем до и склеиваем первый со вторым
    copy_after(Set, 1, Idx, A1),
    copy_before(Set, 1, Idx, A2),
    append(A1, A2, A).
    
copy_after([], _,_ ,[]). % Если передан пустой список
copy_after([_|Tail], I, Idx, A):- % Если меньше или равно искомому, то просто крутим список
    I =< Idx, !,
    I1 is I + 1,
    copy_after(Tail, I1, Idx, A).
copy_after([X|Tail], I ,Idx, [X|Tail2]):- % Если больше искомого, то копируем x и крутим список
    I > Idx, !,
    I1 is I + 1,
    copy_after(Tail, I1, Idx, Tail2).

copy_before([], _,_ ,[]).% Если передан пустой список
copy_before([_|Tail], I, Idx, A):-% Если больше искомого, то просто крутим список
    I > Idx, !,
    I1 is I + 1,
    copy_before(Tail, I1, Idx, A).
copy_before([X|Tail], I, Idx, [X|Tail2]):-% Если меньше или равно искомому, то копируем x и крутим список
    I =< Idx, !,
    I1 is I + 1,
    copy_before(Tail, I1, Idx, Tail2).
