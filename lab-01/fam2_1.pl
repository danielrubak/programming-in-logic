rodzic(kasia,robert).
rodzic(tomek,robert).
rodzic(tomek,eliza).
rodzic(robert,anna).
rodzic(robert,magda).
rodzic(magda,jan).

kobieta(kasia).
kobieta(eliza).
kobieta(magda).
kobieta(anna).

mezczyzna(tomek).
mezczyzna(robert).
mezczyzna(jan).

famme(kasia).
homme(krzys).
parent(kasia,krzys).

% X is mother for Y
matka(X,Y) :-
	rodzic(X,Y),
	kobieta(X).

ojciec(X,Y) :-
	rodzic(X,Y),
	mezczyzna(X).

przodek(X,Y) :-
	rodzic(X,Y).

przodek(X,Z) :-
	rodzic(X,Y),
	przodek(Y,Z).

brat(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	mezczyzna(X),
	X \= Y.

czlowiek(X) :-
	mezczyzna(X).
czlowiek(X) :-
	kobieta(X).

siostra(X,Y) :-
	rodzic(Z,X),
	rodzic(Z,Y),
	kobieta(X),
	X \= Y.

dziadek(X,Y) :-
	mezczyzna(X),
	rodzic(X,Z),
	rodzic(Z,Y).

babcia(X,Y) :-
	kobieta(X),
	rodzic(X,Z),
	rodzic(Z,Y).

potomek(X,Y) :-
	przodek(Y,X).

krewny(X,Y) :-
	przodek(Z,X),
	przodek(Z,Y),
	X \= Y.
