ostatni(X, [X]).
ostatni(X, [_|X]) :- ostatni(X, Y).

test :- ostatni(X, [4, 3, 5, 6, 7]).
