/*
Example how to divide two lists, in first there are elements lesser then set value
*/

dziel(D, [G|O], [G|L1], L2) :- G < D, dziel(D, O, L1, L2).
dziel(D, [G|O], L1, [G|L2]) :- G > D, dziel(D, O, L1, L2).
dziel(_, [], [], []).

test :- dziel(7, [1, 9, 4, 2, 12], L1, L2).
