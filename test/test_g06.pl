%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [5 pkt] ZADANIE 1 (rozgrzewka z listami)
% Umieść element na zadanej pozycji w liście.
% Przykład:
% ?- umiesc(alfa,[a,b,c,d],2,Wynik).
% Wynik = [a,alfa,b,c,d]

umiesc(Element, List, 0, [Element|List]).

umiesc(Element, [E|List], Position, [E|RL]):-
    Pos1 is Position-1,
    umiesc(Element, List, Pos1, RL).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [10 pkt] ZADANIE 2 (trudniejsze listy)
% Zwróć listę, w której każdy element listy wejściowej jest umieszczony
% podwójnie.
% Przykład:
% ?- podwoj_elementy([x,a,z,c],X).
% X = [x,x,a,a,z,z,c,c]

podwoj_elementy([], []).

podwoj_elementy([H|T], [H,H|Y]) :-
   podwoj_elementy(T, Y).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [15 pkt] ZADANIE 3 (baza wiedzy)
% Dana jest baza wiedzy o osobach:

% osoba(ID, Imię, Nazwisko, Płeć, Urodziny - Śmierć).
osoby([
    osoba(olgierd, 'Olgierd', 'Jarzyna', m, wydarzenie('Kraków', data(16, 7, 1993)) - brak),
    osoba(onufry, 'Onufry', 'Jarzyna', m, wydarzenie('Kraków', data(8, 3, 2012)) - brak),
    osoba(marianna, 'Marianna', 'Jarzyna', k, wydarzenie('Kraków', data(11, 3, 1994)) - brak),
    osoba(zygmunt, 'Zygmunt', 'Jarzyna', m, wydarzenie('Wieliczka', data(1, 1, 1963)) - wydarzenie('Kraków', data(23, 1, 1994))),
    osoba(honorata, 'Honorata', 'Jarzyna', k, wydarzenie('Skała', data(13, 7, 1955)) - wydarzenie('Skała', data(2, 8, 1997)))
]).

% (a) [5 pkt]
% Napisz predykat, które sprawdza czy dana osoba urodziła się i umarła
% w tym samym miejscu.
% Przykład:
% ?- to_samo_miejsce(osoba(honorata, 'Honorata', 'Jarzyna', k, wydarzenie('Skała', data(13, 7, 1955)) - wydarzenie('Skała', data(2, 8, 1997))))
% True

%to_samo_miejsce(Osoba) :- fail.

% (b) [10 pkt]
% Wykorzystując powyższy, napisz predykat, który dla danej listy osób
% zwraca listę osób, które urodziły się i umarły w tym samym miejscu.
% Przykład:
% ?- lista_osob_to_samo_miejsce(osoby, Szukane).
% Szukane = [osoba(honorata, ...)]

%lista_osob_to_samo_miejsce(ListaOsob, ZnalezioneOsoby) :- fail.
