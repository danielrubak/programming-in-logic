% ------------------------------------------------ %
% -----             RANDOM  TEST             ----- %
% ------------------------------------------------ %

umiesc(Element, List, 0, [Element|List]).

umiesc(Element, [E|List], Position, [E|RL]):-
    Pos1 is Position-1,
    umiesc(Element, List, Pos1, RL).

% ------------------------------------------------ %
% -----            FIRST GROUP 2019          ----- %
% ------------------------------------------------ %

dodaj_jeden([],[]).

dodaj_jeden([X|List], [X2|List2]) :-
    dodaj_jeden(List, List2),
    X2 is X + 1.

podziel([], [], []).

podziel([Head|Tail], [Head|List1], List2) :-
   Head>=0,
   podziel(Tail, List1, List2).

podziel([Head|Tail], List1, [Head|List2]) :-
   Head<0,
   podziel(Tail, List1, List2).

:- op(300, xfy, w).

w(walentina, irina).
w(natasza, katarina).
w(katarina, olga).
w(swietlana, walentina).

ludmila w swietlana.
oksana w radmila.

wewnetrzna(LalkaA, LalkaB) :-
   LalkaA w LalkaB.

wewnetrzna(LalkaA, LalkaB) :-
   LalkaA w LalkaC,
   wewnetrzna(LalkaC, LalkaB).

zewn(Lalka, 0) :-
    \+ w(Lalka,_).

zewn(Lalka, Rozmiar) :-
    Lalka w LalkaB,
    zewn(LalkaB,D),
    Rozmiar is D + 1.

wewn(Lalka, 0) :-
    \+ w(_,Lalka).

wewn(Lalka, Rozmiar) :-
    LalkaB w Lalka,
    wewn(LalkaB,D),
    Rozmiar is D + 1.

rozmiar_grupy(Lalka, Rozmiar) :-
    zewn(Lalka,D),
    wewn(Lalka,C),
    Rozmiar is D + C + 1.

% ------------------------------------------------ %
% -----          SECOND GROUP 2019           ----- %
% ------------------------------------------------ %

zakres(Stop, Stop, [Stop]).

zakres(Start, Stop, [Start|RL]) :-
   Start1 is Start + 1,
   zakres(Start1, Stop, RL).

dziel_na_pol(L, A, B) :-
	append(A, B, L),
	length(A, N),
	length(B, N).

takie_same([], []).

takie_same([H1|R1], [H2|R2]) :-
	H1 = H2,
	takie_same(R1, R2).

podwojna(X) :-
	dziel_na_pol(X,A,B),
	takie_same(A,B).

:- op(50,xf,jest_kobieta).
:- op(50,xf,jest_mezczyzna).

jest_kobieta(X) :-
	kobieta(X).

jest_mezczyzna(X) :-
	mezczyzna(X).

rodzic(X,Y) :- dziecko(Y,X).
matka(X,Y) :- rodzic(X,Y), kobieta(X).
ojciec(X,Y) :- rodzic(X,Y), mezczyzna(X).
przodek(X,Y) :- rodzic(X,Y).
przodek(X,Z) :- rodzic(X,Y), przodek(Y,Z).
potomek(X,Y) :- rodzic(Y,X).
potomek(Z,X) :- rodzic(Y,Z), potomek(Y,X).
dziadkowie(X,Y) :- rodzic(X,Z), rodzic(Z,Y).
dziadek(X,Y) :- dziadkowie(X,Y),mezczyzna(X).
babcia(X,Y) :- dziadkowie(X,Y), kobieta(X).
pradziadkowie(X,Y) :- dziadkowie(X,Z), rodzic(Z,Y).

wspolne_pokolenie(X,Y) :-
	rodzic(P,X),
	rodzic(P,Y),
	X \= Y.

wspolne_pokolenie(X,Y) :-
	dziadkowie(P,X),
	dziadkowie(P,Y),
	X \= Y.

wspolne_pokolenie(X,Y) :-
	pradziadkowie(P,X),
	pradziadkowie(P,Y),
	X \= Y.

% ------------------------------------------------ %
% -----           THIRD GROUP 2019           ----- %
% ------------------------------------------------ %
