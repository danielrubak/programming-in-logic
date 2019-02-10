/*
asc(L1, L2) :-
	L2 is the result of ascending sort the lists L1.
*/

asc([], []).

asc([X|T], S1) :-
    asc(T, St),
    my_insert(X, St, S1).

my_insert(X, [Y|S1], [Y|Sl1]) :-
    XY,
    !,
    my_insert(X, S1, Sl1).
	
my_insert(X, S1, [X|S1]).
