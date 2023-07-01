floor(X, Floor) :- Floor is floor(X).

ceil(X, Ceil) :-  Ceil is ceiling(X).

abs(X, Abs) :- X >= 0, 
                Abs is X.
abs(X, Abs) :- X < 0, 
                Abs is -X.

main :-
    read(Number),
    floor(Number, Floor),
    ceil(Number, Ceil),
    abs(Number, Abs),
    format('Floor de ~w = ~w~n', [Number, Floor]),
    format('Ceil de ~w = ~w~n', [Number, Ceil]),
    format('Abs de ~w = ~w~n', [Number, Abs]),
    halt.