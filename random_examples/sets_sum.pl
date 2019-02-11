/*

*/

suma([], X, X).
suma([X|R], Y, Z) :- member(X, Y), !, suma(R, Y, Z).
suma([X|R], Y, [X|Z]) :- suma(R, Y, Z).

test :- suma([1, 2, 3], [2, 4], C).
