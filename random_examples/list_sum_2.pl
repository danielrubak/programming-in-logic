/*
sumlist(Is, Sum) :-
    Sum is the sum of the list of integers Is.
*/

sumlist([I|Is], Sum) :-
    sumlist(Is, IsSum),
    Sum is I+IsSum.

sumlist([], 0).
