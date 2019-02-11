/*
min(L1, Max) :-
    find the min element in list L1 return it as Max
*/

min([H|[]], H).

min([H|T], Minimum) :-
    min(T, M1),
    mn(H, M1, Minimum),
    !.

mn(X, Y, X) :- X < Y.

mn(X, Y, Y) :- X >= Y.
