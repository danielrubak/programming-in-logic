/*
list_linking(L1, L2, L3) :-
    links lists L1 and L2 and assign the result to L3
*/

list_linking([], L, L).

list_linking([X|L1], L2, [X|L3]) :-
    list_linking(L1, L2, L3).
