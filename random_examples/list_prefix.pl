prefiks([], _).
prefiks([X|L1], [X|L2]) :- prefiks(L1, L2).

test :- prefiks([d, f, w, k], [d, f, w, k, r, u, v, z]).