/*
   mymerge(Xs,Ys,Zs) :- 
	Zs is an ordered list of integers obtained from merging
	the ordered lists of integers Xs and Ys.
*/
     mymerge([X|Xs],[Y|Ys],[X|Zs]) :-
	X < Y, !, mymerge(Xs,[Y|Ys],Zs).
     mymerge([X|Xs],[Y|Ys],[X,Y|Zs]) :-
	X =:= Y, !, mymerge(Xs,Ys,Zs).
     mymerge([X|Xs],[Y|Ys],[Y|Zs]) :-
	X > Y, !, mymerge([X|Xs],Ys,Zs).
     mymerge(Xs,[],Xs) :- !.
     mymerge([],Xs,Xs) :- !.

%  Program 11.2    Merging with cuts


