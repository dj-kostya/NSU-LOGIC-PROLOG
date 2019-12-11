replace(_, _, [], []). % Если список пуст, то ничгео не делаем
replace(F, To, [X|Tail], [X|Tail2]) :- X =\= F, replace(F, To, Tail, Tail2), !. % Если текущий эл-т не, то, что мы ищем, то просто крутим список дальше
replace(F, To, [F|Tail], [To|Tail2]) :- replace(F, To, Tail, Tail2). % Если мы нашли эл-т, который нужно найти, то меняем и продолжаем крутить список