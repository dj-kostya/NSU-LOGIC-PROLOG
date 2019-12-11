get_by_id([], _, _, _). % Если пустой список, то ничего не делаем
get_by_id([X|_], I, I, X). % Если нашли нужный индекс, то возвращаем значение
get_by_id([_|Tail], I, Idx, A):- % Если не нашли нужный индекс, то крутим список дальше
    I =\= Idx, !,
    I1 is I + 1,
    get_by_id(Tail, I1, Idx, A).

len([],0). % Если передан пустой список
len([_| Tail], A):- % Рекурсивно считаем длинну: считаем длинну хвоста, прибавляем один и возвращаем ответ (тормозим в 1 предикате)
    len(Tail, A1),
    A is A1 + 1.

get_column([], _, []). % Если матрица пустая
get_column([Row| Tail1], I, [Column| Tail2]):- % Получаем эл-ты в стобце
    get_by_id(Row, 1, I, Column),
    get_column(Tail1, I, Tail2).

start([],[]). % Если матрица пустая
start(M, A):- % Стартовый предикат
    len(M, L),
    transposer(M, 1,L, A).
    

transposer(M, I, L,  [Row| Tail]):- % Проходим по 1 строке и поворачиваем столбцы
    I =< L, !,
    get_column(M, I, Row),!,
    I1 is I + 1,
    transposer(M, I1,L, Tail).

transposer(_, _, _, []). % Иначе тормозим