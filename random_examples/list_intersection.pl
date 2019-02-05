/*
   intersection(Xs,Ys,Is) :- Is is the intersection of the elements in Xs and Ys.
*/

intersection([X|Xs],Ys,[X|Is]) :- member(X,Ys), intersection(Xs,Ys,Is).
intersection([X|Xs],Ys,Is) :- nonmember(X,Ys), intersection(Xs,Ys,Is).
intersection([],Ys,[]).
/*
   nonmember(X,Xs) :- X is not a member of the list Xs.
*/
     nonmember(X,[Y|Ys]) :- X \== Y, nonmember(X,Ys).
     nonmember(X,[]).

%  Program 13.2    Finding the intersection of two lists
