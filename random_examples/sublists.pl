/*
	sublist(Sub,List) :- Sub is a sublist of List.
*/
/*
	prefix(Prefix,List) :- Prefix is a prefix of List.
*/

	prefix([],Ys).
	prefix([X|Xs],[X|Ys]) :- prefix(Xs,Ys).

/*
	suffix(Suffix,List) :- Suffix is a suffix of List.
*/

	suffix(Xs,Xs).
	suffix(Xs,[Y|Ys]) :- suffix(Xs,Ys).

	% a: Suffix of a prefix
	sublist(Xs,Ys) :- prefix(Ps,Ys), suffix(Xs,Ps).

	% b: Prefix of a suffix
	sublist(Xs,Ys) :- prefix(Xs,Ss), suffix(Ss,Ys).

	% c: Recursive definition of a sublist
	sublist(Xs,Ys) :- prefix(Xs,Ys).
	sublist(Xs,[Y|Ys]) :- sublist(Xs,Ys).

	% d: Prefix of a suffix, using append
	sublist(Xs,AsXsBs) :-
		append(As,XsBs,AsXsBs), append(Xs,Bs,XsBs).

	% e: Suffix of a prefix, using append
	sublist(Xs,AsXsBs) :-
		append(AsXs,Bs,AsXsBs), append(As,Xs,AsXs).

%	Program 3.14: Determining sublists of lists
