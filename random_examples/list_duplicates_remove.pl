/*
no_doubles(Xs, Ys) :-
	Ys is the list obtained by removing duplicate elements from the list Xs.
*/

no_doubles([X|Xs], Ys) :-
	member(X, Xs),
	no_doubles(Xs, Ys).

no_doubles([X|Xs], [X|Ys]) :-
	nonmember(X, Xs),
	no_doubles(Xs, Ys).

no_doubles([], []).

nonmember(X, [Y|Ys]) :-
	X \== Y,
	nonmember(X, Ys).

nonmember(X,[]).
