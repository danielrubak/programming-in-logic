%% First way to solve the quadratic equation

delta(A, B, C, Result) :-
	Result is B * B - 4 * A * C.

kwadrat(A, B, C, Result) :-
	delta(A, B, C, Delta),
	(Delta < 0 ->
		Result = false;
	Delta = 0 ->
		Result is ((-1) * B) / (2 * A);
	Delta > 0 ->
		Result is ((-1) * B - sqrt(Delta))/(2 * A);
		Result is ((-1) * B + sqrt(Delta))/(2 * A);
	Delta > 0 ->
		Result is ((-1) * B + sqrt(Delta))/(2 * A)
	).
