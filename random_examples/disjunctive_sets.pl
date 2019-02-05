rozlaczne(A, B) :- member(X, A), not(member(X, B)).

test :- rozlaczne([1, 2, 3], [6, 3, 5]).
