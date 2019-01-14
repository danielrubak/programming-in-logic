%% Second way to solve the quadratic equation

delta(A, B, C, Result) :-
	Result is B * B - 4 * A * C.

kwadrat(A, B, C, Result) :-
	delta(A, B, C, Delta),
	Delta > 0,
	Result is (-B - sqrt(D))/(2*A).

kwadrat(A, B, C, Result) :-
   delta(A, B, C, Delta),
   Delta > 0,
   Result is (-B + sqrt(D))/(2*A).

kwadrat(A, B, C, Result) :-
   delta(A, B, C, Delta),
   Delta = 0,
   Result is (-B - sqrt(D))/(2*A).

kwadrat(A, B, C, Result) :-
   delta(A, B, C, Delta),
   Delta < 0,
   fail.
