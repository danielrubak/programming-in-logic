%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [5 pkt] ZADANIE 1 (rozgrzewka z listami)
% Znajdź przedostatni element listy.
% Przykład:
% ?- znajdz_przedostatni([a,b,c,d,e],Elem).
% Elem = d

znajdz_przedostatni([H|[_|[]]], H).

znajdz_przedostatni([_|T], Elem) :-
	znajdz_przedostatni(T,Elem).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [10 pkt] ZADANIE 2 (trudniejsze listy)
% Podziel listę na dwie części. W pierwszej z nich powinny znaleźć się
% elementy parzyste, a w drugiej z nich elementy nieparzyste.
% Przykład:
% ?- podziel([1,3,2,7,8], Parzyste, Nieparzyste).
% Parzyste = [2,8]
% Nieparzyste = [1,3,7]

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

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [15 pkt] ZADANIE 3 (baza wiedzy)
% Dana jest baza wiedzy o osobach:

% osoba(ID, Imię, Nazwisko, Płeć, Urodziny - Śmierć).
osoba(olgierd, 'Olgierd', 'Jarzyna', m, wydarzenie('Kraków', data(16, 7, 1993)) - brak).
osoba(onufry, 'Onufry', 'Jarzyna', m, wydarzenie('Kraków', data(8, 3, 2012)) - brak).
osoba(marianna, 'Marianna', 'Jarzyna', k, wydarzenie('Kraków', data(11, 3, 1994)) - brak).
osoba(zygmunt, 'Zygmunt', 'Jarzyna', m, wydarzenie('Wieliczka', data(1, 1, 1963)) - wydarzenie('Kraków', data(23, 1, 1994))).
osoba(honorata, 'Honorata', 'Jarzyna', k, wydarzenie('Skała', data(13, 7, 1955)) - wydarzenie('Skała', data(2, 8, 1997))).

% (a) [5 pkt]
% Napisz predykat, które sprawdza czy jedna data jest wcześniejsza od drugiej.
% Przykład:
% ?- wczesniejsza(data(14,10,2002), data(13,10,2002)).
% False
% ?- wczesniejsza(data(1,1,2001), data(1,1,2002)).
% True

wczesniejsza(data(_,_,Y), data(_,_,YY)) :-
	Y < YY.
wczesniejsza(data(_,M,Y), data(_,MM,YY)) :-
	Y = YY,
	M < MM.

wczesniejsza(data(D,M,Y), data(DD,MM,YY)) :-
	Y = YY,
	M = MM,
	D < DD.

% (b) [10 pkt]
% Wykorzystując powyższy, napisz predykat, który sprawdza czy dane dwie
% osoby miały szansę się kiedyś spotkać (czy ich okresy życia nachodziły
% na siebie).
% Przykład:
% ?- spotkaly_sie(zygmunt, marianna)
% False
% ?- spotkaly_sie(honorata, zygmunt)
% True
% ?- spotkaly_sie(olgierd, onufry)
% True

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
