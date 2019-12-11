push(X, [Cur|Tail1], [Cur|Tail2]):- % Если X больше текущего эл-та, то крутим список дальше
    X > Cur, !,
    push(X,Tail1,Tail2).
push(X, Tail1, [X|Tail1]). % Если не сработало первое условие, то вставляем эл-т и перестаем крутить

sort_insert([], []). % Если пусто, то ничего не делаем
sort_insert([X| Tail], A):- % Берем X, сортируем хвост, затем вставляем X на его место
    sort_insert(Tail, A1),
    push(X, A1, A).

