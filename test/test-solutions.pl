dodaj_jeden([],[]).

dodaj_jeden([X|List], [X2|List2]) :-
    dodaj_jeden(List, List2),
    X2 is X + 1.

% ------------------------------------------------ %

podziel([], [], []).

podziel([Head|Tail], [Head|List1], List2) :-
   Head>=0,
   podziel(Tail, List1, List2).

podziel([Head|Tail], List1, [Head|List2]) :-
   Head<0,
   podziel(Tail, List1, List2).

% ------------------------------------------------ %

umiesc(Element, List, 0, [Element|List]).

umiesc(Element, [E|List], Position, [E|RL]):-
    Pos1 is Position-1,
    umiesc(Element, List, Pos1, RL).

% ------------------------------------------------ %

zakres(Stop, Stop, [Stop]).

zakres(Start, Stop, [Start|RL]) :-
   Start1 is Start + 1,
   zakres(Start1, Stop, RL).

% ------------------------------------------------ %

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
