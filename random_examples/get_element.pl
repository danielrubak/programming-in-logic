znajdz(_, [], _) :- !, fail.
znajdz(1, [X|_], X) :- !.
znajdz(N, [_|O], X) :- M is N-1, znajdz(M, O, X).

test :- znajdz(3, [11, 34, 51, 17, 29], X).
