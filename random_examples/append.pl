/*
append(Xs, Ys, XsYs) :-
	XsYs is the result of concatening the lists Xs and Ys.
*/

append([], Ys, Ys).

append([X|Xs], Ys, [X|Zs]) :-
	append(Xs, Ys, Zs).
