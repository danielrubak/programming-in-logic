%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [5 pkt] ZADANIE 1 (rozgrzewka z listami)
% Znajdź K-ty element listy. Zakładamy, że pierwszy element ma numer 1.
% Przykład:
% ?- znajdz_element([a,b,c,d,e],3,Elem).
% Elem = c

znajdz_element([Elem|_], 1, Elem).

znajdz_element([_|List], K, Elem) :-
   K > 1,
   K1 is K - 1,
   znajdz_element(List, K1, Elem).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [10 pkt] ZADANIE 2 (trudniejsze listy)
% Podziel listę na dwie części. Długość PIERWSZEJ z nich jest podana jako
% argument Len1. Nie używaj żadnych predefiniowanych predykatów.
% Przykład:
% ?- podziel([a,b,c,d,e,f,g,h,i,k], 3, List1, List2).
% List1 = [a,b,c]
% List2 = [d,e,f,g,h,i,k]

podziel(List,0,[],List).

podziel([X|Xs],N,[X|Ys],Zs) :-
   N > 0,
   N1 is N - 1,
   podziel(Xs,N1,Ys,Zs).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [15 pkt] ZADANIE 3 (baza wiedzy)
% Dana jest baza wiedzy połączeń kolejowych jak niżej:

% bezposredniDo(MiastoPoczatkowe, MiastoKoncowe)
bezposredniDo(warszawa, krakow).
bezposredniDo(warszawa, gdansk).
bezposredniDo(warszawa, lodz).
bezposredniDo(katowice, krakow).
bezposredniDo(katowice, poznan).

% (a) [5 pkt]
% Zdefiniuj bezposredniDo jako operator, który pozwoli na definiowanie
% połączeń w sposób jak poniżej (odkomentuj te linie po zdefiniowaniu
% operatora)

:- op(300,xfy,bezposredniDo).

szczecin bezposredniDo swinoujscie.
rzeszow bezposredniDo krakow.

% Poniższa linia po odkomentowaniu powinna wyrzucać błąd
% (po zdefiniowaniu operatora) związany z brakiem nawiasów

% warszawa bezposredniDo moskwa bezposredniDo wladywostok

% (b) [10 pkt]
% Dopisz predykat polaczenie/2, który sprawdza czy istnieje możliwość
% dotarcia z miasta A do miasta B na podstawie bazy połączeń.
% Przykład:
% ?- polaczenie(poznan, warszawa).
% True   %% bo istnieje połączenie przez katowice, krakow
% ?- polaczenie(swinoujscie, krakow).
% False

bezposredni(MiastoA, MiastoB) :- bezposredniDo(MiastoA, MiastoB) ; bezposredniDo(MiastoB, MiastoA).

polaczenie(MiastoA, MiastoB) :- polaczenie(MiastoA, MiastoB, []).

polaczenie(MiastoA, MiastoB, _) :- bezposredni(MiastoA, MiastoB).

polaczenie(MiastoA, MiastoB, Visited) :-
    bezposredni(MiastoA, MiastoC),
    \+ member(MiastoC, Visited),
    polaczenie(MiastoC, MiastoB, [MiastoC|Visited]),
    MiastoA \= MiastoB.
