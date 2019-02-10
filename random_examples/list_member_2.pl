/*
member(Element, List) :-
	Element is an element of the list List
*/

member(X, [X|Xs]).

member(X, [Y|Ys]) :-
	member(X, Ys).
