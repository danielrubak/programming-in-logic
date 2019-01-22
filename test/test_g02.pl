%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [5 pkt] ZADANIE 1 (rozgrzewka z listami)
% Stwórz listę zawierającą wszystkie liczby całkowite z zadanego zakresu.
% Przykład:
% ?- zakres(4,9,Lista).
% Lista = [4,5,6,7,8,9]

zakres(Stop, Stop, [Stop]).

zakres(Start, Stop, [Start|RL]) :-
   Start1 is Start + 1,
   zakres(Start1, Stop, RL).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [10 pkt] ZADANIE 2 (trudniejsze listy)
% Lista jest podwójna jeżeli składają się na nią dwie identyczne części.
% Sprawdź czy lista podana jako argument jest podwójna.
% Przykład:
% ?- podwojna([a,b,c,d,a,b,c,d]).
% True
% ?- podwojna([a,b,a]).
% False

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [15 pkt] ZADANIE 3 (baza wiedzy)
% Poniższa baza wiedzy opisuje wybrane relacje w austriackiej
% dynastii Habsburgów na przełomie XVII i XVIII wieku:

mezczyzna(franciszek_I).
mezczyzna(franciszek_II).
mezczyzna(jozef_I).
mezczyzna(jozef_II).
mezczyzna(karol_VI).
mezczyzna(leopold_I).
mezczyzna(leopold_II).
mezczyzna(ferdynand_I).

kobieta(maria_teresa).
kobieta(maria_antonina).

% dziecko(Dziecko, Rodzic).
dziecko(leopold_II, maria_teresa).
dziecko(franciszek_II, leopold_II).
dziecko(jozef_I, leopold_I).
dziecko(karol_VI, leopold_I).
dziecko(maria_teresa, karol_VI).
dziecko(jozef_II, maria_teresa).
dziecko(jozef_II, franciszek_I).
dziecko(leopold_II, franciszek_I).
dziecko(maria_antonina, maria_teresa).
dziecko(maria_jozefa, jozef_I).
dziecko(maria_amalia_wettyn, maria_jozefa).

% (a) [7.5 pkt]
% Zdefiniuj operatory jest_kobieta i jest_mezczyzna działające jak niżej:
% ?- maria_teresa jest_mezczyzna.
% False
% ?- X jest_kobieta.
% X = maria_teresa;
% X = maria_antonina.

:- op(50,xf,jest_kobieta).
:- op(50,xf,jest_mezczyzna).

jest_kobieta(X) :-
	kobieta(X).

jest_mezczyzna(X) :-
	mezczyzna(X).

% (b) [7.5 pkt]
% Dopisz predykat wspolne_pokolenie/2, który sprawdza czy osoby A i B
% są na tym samym poziomie w drzewie genealogicznym.
% Przykład:
% ?- wspolne_pokolenie(jozef_II, jozef_II).
% False   %% Chcemy się uchronić przed sytuacją, w której predykat zwraca
%         %% nam, że ktoś jest w relacji z samym sobą
% ?- wspolne_pokolenie(maria_amalia_wettyn, maria_antonina).
% True    %% Wspólny pradziadek (leopold_I)

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
