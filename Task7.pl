find_set([], _, _, []). % Если передали пустой сет

find_set([_|Tail1], Idx, Cur, [H1|Tail]):- % Крутим сет пока не найдем нужный индекс
    Cur < Idx, !,
    Cur1 is Cur + 1,
    find_set(Tail1, Idx, Cur1, [H1|Tail]).

find_set(Tail1, Idx, Cur, Tail1):- % Копируем хвост в ответ
    Cur >= Idx, !.

start(Set, Max_idx, Answer):- % Стартовый предикат
    I is 1,
    find_set(Set, Max_idx, I, Answer).