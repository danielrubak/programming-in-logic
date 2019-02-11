/*
perm(L1, Perm) :-
    find all permutation of list L1
*/

perm(List, [H|Perm]) :-
    delete(H, List, Rest),
    perm(Rest, Perm).

perm([], []).

delete(X, [X|T], T).

delete(X, [H|T], [H|NT]) :-
    delete(X, T, NT).
