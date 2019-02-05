Finding greates element from list

max([H|[]], H).
max([H|T], Maximum) :- max(T, M1), mx(H, M1, Maximum), !.
mx(X, Y, X) :- X > Y.
mx(X, Y, Y) :- X =< Y.

test :- max([6, 2, 5, 4, 8], M).
