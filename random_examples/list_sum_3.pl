/*
sumlist(Is, Sum) :-
    Sum is the sum of the list of integers Is.
*/

sumlist(Is, Sum) :-
    sumlist(Is, 0, Sum).


sumlist([I|Is], Temp, Sum) :-
    Temp1 is Temp+I,
    sumlist(Is, Temp1, Sum).

sumlist([], Sum, Sum).
