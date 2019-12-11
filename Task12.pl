scalar([],[],0). % Если передан пустой список, то скалярное произведение 0
scalar([X1|Tail1], [X2|Tail2], A):- % Ищем скалярное произведение от хвоста, и прибавляем произведение текущих эл-тов
    scalar(Tail1, Tail2, A1),
    A is X1 * X2 + A1.

