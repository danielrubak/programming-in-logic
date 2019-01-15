nalezy1(X,[X|_]) :- write(X).
nalezy1(X,[_|O]) :-
	nalezy1(X,O).


nalezy2(X,[X|_]) :- !, write(X).
nalezy2(X,[_|O]) :-
	nalezy2(X,O).
