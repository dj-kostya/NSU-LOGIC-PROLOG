del([], []). % Если пустой список на входе, то выдаем пустой
del([X|Tail], A):- % Если X лежит в "хвосте", то его игнорируем и передаем дальше только хвост
    member(X, Tail), !,
    del(Tail, A).
del([X|Tail], [X|Tail2]):- % Иначе сохраняем X в ответ и передаем дальше хвосты.
    !,
    del(Tail, Tail2).
    