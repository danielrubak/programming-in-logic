/*
change_element(X, L1, Y, L2) :-
    change all occurrences of element X in L1 to Y and save result to L2
*/

change_element(_, [], _, []).

change_element(X, [X|L1], Y, [Y|L2]) :-
    !,
    change_element(X, L1, Y, L2).

change_element(X, [A|L1], Y, [A|L2]) :-
    change_element(X, L1, Y, L2).
