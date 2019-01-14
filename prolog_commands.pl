%% Włączenie powłoki:
%% swipl

%% Wyłączenie powłoki:
halt.

%% W Prologu każda linia musi się kończyć kropką!

%% Wczytywanie pliku:
[nazwa_pliku].

%% Średnik powoduje przeskakiwanie do kolejnej znalezionej odpowiedzi.

%% _ - tym symbolem zaznacza się szukaną anonimową

%% Predykat write wypisuje term na wyjście, np. write('Ala ma kota') wypisze w konsoli napis 'Ala ma kota'.

%% Predykat 'nl' przechodzi do nowej linii.

%%
%% Predykaty assert/a/z /1, retract/a/z /1 pozwalają na dodawanie, usuwanie faktów do/z bazy wiedzy, na/do jej początku/końca.

%% Predykat abolish/1 pozwala usunąć predykat z bazy wiedzy. (np. abolish(kobieta/1).)

%% Predykat retractall/1 pozwala usunąć klauzule danego predykatu z bazy wiedzy. (np. retractall(kobieta(K)).)

%% Predykaty see/n, tell/told pozwalają na odczyt, zapis bazy wiedzy z/do pliku.

%% Uruchomienie programu ze wskazanego pliku (plik.pl) z poziomu systemu operacyjnego można zrealizować za pomocą:
swipl -s program.pl -g go -t halt

%% Correct way of writing equations arithmetic:
X is 2 + 2.
%% If there is need to use predefined variable this is the correct method:
A is 3, B is A + 4.
