/*
flatten(Xs, Ys) :-
    Ys is a list of the elements of Xs.
*/

flatten(Xs, Ys) :-
    flatten(Xs, [], Ys).

flatten([X|Xs], S, Ys) :-
    list(X),
    flatten(X, [Xs|S], Ys).

flatten([X|Xs], S, [X|Ys]) :-
    X \== [],
    flatten(Xs, S, Ys).

flatten([], [X|S], Ys) :-
    flatten(X, S, Ys).

flatten([], [], []).

list([X|Xs]).
