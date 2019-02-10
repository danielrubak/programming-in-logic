/*
list_divide(X, L, L1, L2) :-
    L1 is a list that contains elements of list L smaller than X, L2 contains elements of List L greater than X.
*/

list_divide(D, [G|O], [G|L1], L2) :-
    G < D,
    list_divide(D, O, L1, L2).

list_divide(D, [G|O], L1, [G|L2]) :-
    G > D,
    list_divide(D, O, L1, L2).

list_divide(_, [], [], []).
