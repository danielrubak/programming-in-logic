/*

*/

change_element(_, [], _, []).

change_element(X, [X|L1], Y, [Y|L2]) :-
    !,
    change_element(X, L1, Y, L2).

change_element(X, [A|L1], Y, [A|L2]) :-
    change_element(X, L1, Y, L2).
