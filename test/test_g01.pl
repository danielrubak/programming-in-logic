%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [5 pkt] ZADANIE 1 (rozgrzewka z listami)
% Dodaj 1 do każdego elementu listy Lista i zwróć wynik jako ListaPlus1.
% Przykład:
% ?- dodaj_jeden([5,3,19,4],X).
% X = [6,4,20,5]

dodaj_jeden([],[]).

dodaj_jeden([X|List], [X2|List2]) :-
    dodaj_jeden(List, List2),
    X2 is X + 1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [10 pkt] ZADANIE 2 (trudniejsze listy)
% Podziel listę na dwie części. W pierwszej z nich powinny znaleźć się
% elementy dodatnie, a w drugiej z nich elementy ujemne.
% Przykład:
% ?- podziel([1,-3,-7,2,8], Dodatnie, Ujemne).
% Dodatnie = [1,2,8]
% Ujemne = [-3,-7]

podziel([], [], []).

podziel([Head|Tail], [Head|List1], List2) :-
   Head>=0,
   podziel(Tail, List1, List2).

podziel([Head|Tail], List1, [Head|List2]) :-
   Head<0,
   podziel(Tail, List1, List2).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [15 pkt] ZADANIE 3 (baza wiedzy)
% Znasz matrioszki? To rosyjskie wydrążone w środku lalki, które są włożone
% jedna w drugą.
% Dana jest baza wiedzy o naszym zbiorze matrioszek jak niżej:

% w(WewnętrznaLalka, ZewnętrznaLalka) -- definiuje bezpośrednie połączenie
% między matrioszkami (tzn. walentina znajduje się bezpośrednio w irinie)
w(walentina, irina).
w(natasza, katarina).
w(katarina, olga).
w(swietlana, walentina).

% (a) [5 pkt]
% Chcemy mieć możliwość definiowana bazy jak niżej. Spraw, aby było to
% możliwe (odkomentuj te linie po wykonaniu tej części zadania)

:- op(300, xfy, w).

ludmila w swietlana.
oksana w radmila.

% (b) [5 pkt]
% Dopisz predykat wewnetrzna/2, który sprawdza czy lalka A jest
% wewnątrz lalki B (albo bezpośrednio albo pośrednio).
% Przykład:
% ?- wewnetrzna(natasza, olga).
% True   %% pomiędzy nimi jest katarina
% ?- wewnetrzna(radmila, oksana).
% False

wewnetrzna(LalkaA, LalkaB) :-
   LalkaA w LalkaB.

wewnetrzna(LalkaA, LalkaB) :-
   LalkaA w LalkaC,
   wewnetrzna(LalkaC, LalkaB).

% (c) [5 pkt]
% Dopisz predykat rozmiar_grupy/2, który wylicza ile matrioszek jest
% w grupie razem ze wskazaną lalką (albo na zewnątrz albo wewnątrz
% wskazanej lalki).
% Przykład:
% ?- rozmiar_grupy(swietlana, X).
% X = 4  % ludmila, swietlana, walentina, irina

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
