operar(0, X, Y, R) :- R is X + Y.
operar(1, X, Y, R) :- R is X - Y.
operar(2, X, Y, R) :- R is X * Y.
operar(3, X, 0, R) :- R is X.
operar(3, X, Y, R) :- R is X / Y.

calcular(_, [], Numero, R) :- R is Numero.
calcular(I, [ H | T], X, Resultado) :-
    Aux is mod(I, 4),
    operar(Aux, X, H, TempResultado),
    calcular(I + 1, T, TempResultado, Resultado).
    
    
main :- 
    read(Lista),
    read(NumeroInicial),
    calcular(0, Lista, NumeroInicial, Resultado),
    writeln(Resultado),
    halt.