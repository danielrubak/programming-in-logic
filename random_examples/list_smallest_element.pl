% Finding least element from list 

min([H|[]], H).
min([H|T], Minimum) :- min(T, M1), mn(H, M1, Minimum), !.
mn(X, Y, X) :- X < Y.
mn(X, Y, Y) :- X >= Y.

test :- min([4, 6, 3, 2, 8], M).
