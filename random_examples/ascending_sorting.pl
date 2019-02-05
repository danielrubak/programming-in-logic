rosn([], []).
rosn([X|T], S1) :- rosn(T, St), wstaw(X, St, S1).
wstaw(X, [Y|S1], [Y|Sl1]) :- XY, !, wstaw(X, S1, Sl1).
wstaw(X, S1, [X|S1]).

test :- rosn([4, 7, 9, 5, 2], R).
