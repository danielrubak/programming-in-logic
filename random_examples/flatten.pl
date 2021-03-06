/*
flatten(Xs, Ys) :-
    Ys is a list of the elements of Xs.
*/

flatten([X|Xs], Ys) :-
    flatten(X, Ys1),
    flatten(Xs, Ys2),
    append(Ys1, Ys2, Ys).

flatten(X, [X]) :-
    X \== [].

flatten([], []).
