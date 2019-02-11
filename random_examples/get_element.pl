/*
get_element(X, L2, Index) :-
    find element X on list L2 and set his position to Index
*/

get_element(_, [], _) :-
    !,
    fail.

get_element(1, [X|_], X) :-
    !.

get_element(N, [_|O], X) :-
    M is N-1,
    get_element(M, O, X).
