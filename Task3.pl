f(X,Y):- Y is X*X. % Полезная нагрузка
for(I, N):- % Цикл, от I до I < N , I++
    I is N ; 
    I < N,
    write('x= '), write(I),write(' y= '), f(I,Y), write(Y), write('\n'),  
    I1 is I + 1 ,
    for(I1, N),!.
