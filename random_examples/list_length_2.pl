

/*
	mylength(Xs,N) :- The list Xs has N elements.
*/

	mylength([],0).
	mylength([X|Xs],s(N)) :- mylength(Xs,N).

%	Program 3.17: Determining the length of a list
