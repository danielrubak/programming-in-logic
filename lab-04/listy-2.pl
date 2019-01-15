sklej([], X, X).
sklej([X|L1], L2, [X|L3]) :-
	sklej(L1, L2, L3).

%1
usun_3_z_konca(L1, L2) :-
	sklej(L2, [_,_,_], L1).

%2
usun_3_z_poczatku(L1, L2) :-
	sklej([_,_,_], L2, L1).

%3
usun_3_z_obu_stron(L1, L3) :-
	sklej(L2, [_,_,_], L1),
	sklej([_,_,_], L3, L2).

%4
parzysta([]).
parzysta([_|O]) :-
	nieparzysta(O).
nieparzysta([_|O]) :-
	parzysta(O).

%5
odwroc([],[]).
odwroc([P|O], L1) :-
	odwroc(O, R),
	sklej(R, [P], L1).
palindrom(X) :-
	odwroc(X, Y),
	X = Y.

%6
przesun(L1, [P|O]) :-
	sklej(O, [P], L1).

%7
znaczy(0,zero).
znaczy(1,jeden).
znaczy(2,dwa).
znaczy(3,trzy).
znaczy(4,cztery).
znaczy(5,piec).
znaczy(6,szesc).
znaczy(7,siedem).
znaczy(8,osiem).
znaczy(9,dziewiec).

przeloz([A], [L]) :-
	znaczy(A, L).
przeloz([P|O], [L1|L2]) :-
	znaczy(P, L1),
	przeloz(O, L2).

%8
podzbior([], []).
podzbior([P|O1], [P|O2]) :-
    podzbior(O1, O2).
podzbior([_|O1], O2) :-
    podzbior(O1, O2).

%9
podziel([], [], []).
podziel([L], [L], []).
podziel([L1, L2|O1], [L1|O2], [L2|O3]) :-
    podziel(O1, O2, O3).
