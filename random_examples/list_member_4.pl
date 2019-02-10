/*
members(Xs, Ys) :-
    Each element of the list Xs is an element of the list Ys.
*/

members([X|Xs], Ys) :- member(X, Ys),
    members(Xs, Ys).

members([], Ys).
