/*
max(L1, Max) :-
    find the max element in list L1 return it as Max
*/

max([H|[]], H).

max([H|T], Maximum) :-
    max(T, M1),
    mx(H, M1, Maximum),
    !.

mx(X, Y, X) :-
    X > Y.

mx(X, Y, Y) :-
    X =< Y.
