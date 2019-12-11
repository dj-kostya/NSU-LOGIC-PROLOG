concat([],List,List):-!. % Добавление эл-та в пустой список
concat([X|Tail],List,[X|Tail1]):-concat(Tail,List,Tail1). % Ищем конец списка



find_negative([],_,[]):-!. % Если передали пустой список
find_negative([X|Tail],N,Answer):- % Если отрицательное число, то добавляем номер в ответ
    X<0,
    N1 is N+1,
    find_negative(Tail,N1,List1),
    concat([N],List1,Answer),!.
find_negative([_|Tail],N,Answer):- % Если число не отрицательное крутим список, пока не найдем отрицательное, инкрементируя текущий индекс
    N1 is N+1,
    find_negative(Tail,N1,Answer).

start(List1,Answer):-find_negative(List1,1,Answer). % Стартовый предикат