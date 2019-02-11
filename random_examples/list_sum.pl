/*

*/
suma([], Sum, Sum, Ilosc, Ilosc).
suma([H|T], Sum, Sum1, Ilosc, Ilosc1) :- Nilosc is Ilosc + 1,
Nsuma is Sum1 + H, suma(T, Sum, Nsuma, Ilosc, Nilosc).

test :- suma([1, 2, 3, 4, 4, 5], S, 0, Ilosc, 0).
