
% IMIĘ I NAZWISKO:

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [5 pkt] ZADANIE 1 (rozgrzewka z listami)
% Obetnij pierwszy i ostatni element listy. Jeżeli lista jest krótsza niż
% dwa elementy, powinno zwrócić False.
% Przykład:
% ?- obetnij_liste([x],X).
% False
% ?- obetnij_liste([x,y,z],X).
% X = [y]

usun_ostatni([_], []).

usun_ostatni([H|T], [H|T2]) :-
    usun_ostatni(T,T2).

usun_pierwszy([_|T], T).

obetnij_liste(Lista, KrotszaLista) :-
    usun_ostatni(Lista, T),
    usun_pierwszy(T, KrotszaLista).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [10 pkt] ZADANIE 2 (trudniejsze listy)
% Podziel listę na dwie części. Długość DRUGIEJ z nich jest podana jako
% argument Len2. Nie używaj żadnych predefiniowanych predykatów.
% Przykład:
% ?- podziel([a,b,c,d,e,f,g,h,i,k], 3, List1, List2).
% List1 = [a,b,c,d,e,f,g]
% List2 = [h,i,k]

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

podziel1(L, I, F, B) :-
   length(B,I),
   append(F,B,L).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

% [15 pkt] ZADANIE 3 (baza wiedzy)
% Dana jest naza wiedzy o budynkach:

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

% (a) [5 pkt]
% Zdefiniuj operator jest_nizszy, który sprawdza czy pierwszy
% budynek jest niższy od drugiego.
% Przykład działania:
% ?- budynek('Pałac Kultury i Nauki', 'Warszawa', 237, 1955) jest_nizszy budynek('Warsaw Spire', 'Warszawa', 220, 2015).
% False

:- op(200, xfy, jest_nizszy).

budynek(_,_,H1,_) jest_nizszy budynek(_,_,H2,_) :-
    H1 < H2.

% (b) [10 pkt]
% Zdefiniuj predykat najnizszy/2, który szuka najniższego z budynków
% na zadanej liście
% Przykład:
% ?- budynki(Bud), najnizszy(Bud, X).
% Bud = [...]
% X = budynek('Cosmopolitan Twarda 2/4', 'Warszawa', 160, 2013)

najnizszy([A], A).

najnizszy([budynek(_,_,H1,_)|T], budynek(A,B,H2,C)) :-
    najnizszy(T, budynek(A,B,H2,C)),
    H2 < H1.

najnizszy([budynek(A,B,H1,C)|T], budynek(A,B,H1,C)) :-
    najnizszy(T, budynek(_,_,H2,_)),
    H2 > H1.
