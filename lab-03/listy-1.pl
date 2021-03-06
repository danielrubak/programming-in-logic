trzeci([_,_,C|_], C).

porownaj([_,_,C,D|_]) :-
	C = D.

% Faster way to compare 3rd and 4th elements: porownaj([_,_,C,C|_]).

zamien([A,B,C,D|_],X) :-
	X = [A,B,D,C].

% Faster way to swap the positions of the 3rd and 4th elements: zamien([A,B,C,D|E],[A,B,D,C|E]).

nalezy(X,[X|_]).
nalezy(X,[_|Yogon]) :-
	nalezy(X,Yogon).

dlugosc([],0).
dlugosc([_|Ogon],Dlug) :-
	dlugosc(Ogon,X),
	Dlug is X+1.

a2b([],[]).
a2b([a|Ta],[b|Tb]) :-
   a2b(Ta,Tb).

sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
	sklej(L1,L2,L3).

nalezy1(X,L) :-
	sklej(_,[X|_],L).

nalezy1(X,L) :-
	sklej(_,[X|_],L).

ostatniSklej(X,L):-
	sklej(_,[X],L).

ostatni(X,[X]).
ostatni(E,[_|X]) :-
	ostatni(E,X).

dodaj(X,L,[X|L]).

usun(X,[X|Reszta],Reszta).
usun(X,[Y|Ogon],[Y|Reszta]) :-
	usun(X,Ogon,Reszta).

wstaw(X,L,Duza) :-
	usun(X,Duza,L).

nalezy2(X,L) :-
	usun(X,L,_).

zawiera(S,L) :-
	sklej(_,L2,L),
	sklej(S,_,L2).

permutacja([],[]).
permutacja([X|L],P) :-
	permutacja(L,L1),
	wstaw(X,L1,P).

permutacja2([],[]).
permutacja2(L,[X|P]) :-
	usun(X,L,L1),
	permutacja2(L1,P).

odwroc([],[]).
odwroc([H|T],L) :-
	odwroc(T,R),
	sklej(R,[H],L).

wypisz([H|T]) :-
	put(H), wypisz(T).
wypisz([]).

plural(Noun, PL) :-
	name(Noun, L),
	name(s,T),
	append(L,T, NL),
	name(PL, NL).
