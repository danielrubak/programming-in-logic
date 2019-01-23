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

usun_ostatni([_], []).

usun_ostatni([H|T], [H|T2]) :-
    usun_ostatni(T,T2).

usun_pierwszy([_|T], T).

obetnij_liste(Lista, KrotszaLista) :-
    usun_ostatni(Lista, T),
    usun_pierwszy(T, KrotszaLista).

dlugosc([],0).

dlugosc([_|T], L) :-
    dlugosc(T, X),
    L is X + 1.

sklej([],X,X).
sklej([X|L1],L2,[X|L3]) :-
    sklej(L1,L2,L3).

podziel(List, Len2, List1, List2) :-
    sklej(List1, List2, List),
    dlugosc(List2, Len2).

% Drugi sposob ale nie wolno go stosowac
podziel1(L, I, F, B) :-
   length(B,I),
   append(F,B,L).

% budynek(Nazwa, Miasto, Wysokość, Rok Budowy).
budynki([
    budynek('Pałac Kultury i Nauki', 'Warszawa', 237, 1955),
    budynek('Warsaw Spire', 'Warszawa', 220, 2015),
    budynek('Sky Tower', 'Wrocław', 212, 2012),
    budynek('Warsaw Trade Tower', 'Warszawa', 208, 1999),
    budynek('Złota 44', 'Warszawa', 192, 2013),
    budynek('Rondo 1', 'Warszawa', 192, 2006),
    budynek('Hotel Marriott', 'Warszawa', 170, 1989),
    budynek('Warsaw Financial Center', 'Warszawa', 165, 1998),
    budynek('InterContinental Warsaw', 'Warszawa', 164, 2004),
    budynek('Cosmopolitan Twarda 2/4', 'Warszawa', 160, 2013)
]).

:- op(200, xfy, jest_nizszy).

budynek(_,_,H1,_) jest_nizszy budynek(_,_,H2,_) :-
    H1 < H2.

najnizszy([A], A).

najnizszy([budynek(_,_,H1,_)|T], budynek(A,B,H2,C)) :-
   najnizszy(T, budynek(A,B,H2,C)),
   H2 < H1.

najnizszy([budynek(A,B,H1,C)|T], budynek(A,B,H1,C)) :-
   najnizszy(T, budynek(_,_,H2,_)),
   H2 > H1.

% ------------------------------------------------ %
% -----           FOURTH GROUP 2019          ----- %
% ------------------------------------------------ %

znajdz_przedostatni([H|[_|[]]], H).

znajdz_przedostatni([_|T], Elem) :-
   znajdz_przedostatni(T,Elem).

podziel([L], [L], []) :-
	M is L mod 2,
	M < 1.

podziel([L], [], [L]) :-
	M is L mod 2,
	M > 0.

podziel([H|T], [H|TD], TU) :-
	M is H mod 2,
	M < 1,
	podziel(T,TD,TU).

podziel([H|T], TD, [H|TU]) :-
   M is H mod 2,
	M > 0,
	podziel(T,TD,TU).

osoba(olgierd, 'Olgierd', 'Jarzyna'), m, wydarzenie('Kraków', data(16, 7, 1993)) - brak).
osoba(onufry, 'Onufry', 'Jarzyna', m, wydarzenie('Kraków', data(8, 3, 2012)) - brak).
osoba(marianna, 'Marianna', 'Jarzyna', k, wydarzenie('Kraków', data(11, 3, 1994)) - brak).
osoba(zygmunt, 'Zygmunt', 'Jarzyna', m, wydarzenie('Wieliczka', data(1, 1, 1963)) - wydarzenie('Kraków', data(23, 1, 1994))).
osoba(honorata, 'Honorata', 'Jarzyna', k, wydarzenie('Skała', data(13, 7, 1955)) - wydarzenie('Skała', data(2, 8, 1997))).

wczesniejsza(data(_,_,Y), data(_,_,YY)) :-
	Y < YY.
wczesniejsza(data(_,M,Y), data(_,MM,YY)) :-
	Y = YY,
	M < MM.

wczesniejsza(data(D,M,Y), data(DD,MM,YY)) :-
	Y = YY,
	M = MM,
	D < DD.

spotkaly_sie(IDOsoba1, IDOsoba2) :-
	osoba(IDOsoba1, _,_,_, _ - brak),
	osoba(IDOsoba2, _,_,_, _ - brak).

spotkaly_sie(IDOsoba1, IDOsoba2) :-
	osoba(IDOsoba1, _,_,_, _ - wydarzenie(_,DS)),
	osoba(IDOsoba2, _,_,_, wydarzenie(_, DU) - brak),
	wczesniejsza(DU, DS).

spotkaly_sie(IDOsoba1, IDOsoba2) :-
	osoba(IDOsoba2, _,_,_, _ - wydarzenie(_,DS)),
	osoba(IDOsoba1, _,_,_, wydarzenie(_, DU) - brak),
	wczesniejsza(DU, DS).

spotkaly_sie(IDOsoba1, IDOsoba2) :-
	osoba(IDOsoba1, _,_,_, wydarzenie(_,DU1) - wydarzenie(_,DS1)),
	osoba(IDOsoba2, _,_,_, wydarzenie(_, DU2) - wydarzenie(_,DS2)),
	wczesniejsza(DU1, DS2),
	wczesniejsza(DU2, DS1).

% ------------------------------------------------ %
% -----           FIFTH GROUP 2019           ----- %
% ------------------------------------------------ %

znajdz_element([Elem|_], 1, Elem).

znajdz_element([_|List], K, Elem) :-
   K > 1,
   K1 is K - 1,
   znajdz_element(List, K1, Elem).

podziel(List,0,[],List).

podziel([X|Xs],N,[X|Ys],Zs) :-
   N > 0,
   N1 is N - 1,
   podziel(Xs,N1,Ys,Zs).

% bezposredniDo(MiastoPoczatkowe, MiastoKoncowe)
bezposredniDo(warszawa, krakow).
bezposredniDo(warszawa, gdansk).
bezposredniDo(warszawa, lodz).
bezposredniDo(katowice, krakow).
bezposredniDo(katowice, poznan).

:- op(300,xfy,bezposredniDo).

szczecin bezposredniDo swinoujscie.
rzeszow bezposredniDo krakow.

bezposredni(MiastoA, MiastoB) :- bezposredniDo(MiastoA, MiastoB) ; bezposredniDo(MiastoB, MiastoA).

polaczenie(MiastoA, MiastoB) :- polaczenie(MiastoA, MiastoB, []).

polaczenie(MiastoA, MiastoB, _) :- bezposredni(MiastoA, MiastoB).

polaczenie(MiastoA, MiastoB, Visited) :-
    bezposredni(MiastoA, MiastoC),
    \+ member(MiastoC, Visited),
    polaczenie(MiastoC, MiastoB, [MiastoC|Visited]),
    MiastoA \= MiastoB.

% ------------------------------------------------ %
% -----           SIXTH GROUP 2019           ----- %
% ------------------------------------------------ %
