/*
select_first(X, Xs, Ys) :-
    Ys is the list obtained by removing the first occurrence of X from the list Xs.
*/

select_first(X, [X|Xs], Xs).

select_first(X, [Y|Ys], [Y|Zs]) :-
    X \== Y,
    select_first(X, Ys, Zs).
