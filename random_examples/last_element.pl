/*
last_element(X, Y) :-
    Y is the last element of list X
*/

last_element(X, [X]).

last_element(X, [_|X]) :-
    last_element(X, Y).
