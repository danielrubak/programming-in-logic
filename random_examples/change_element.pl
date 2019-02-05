zastap(_, [], _, []).
zastap(X, [X|L1], Y, [Y|L2]) :- !, zastap(X, L1, Y, L2).
zastap(X, [A|L1], Y, [A|L2]) :- zastap(X, L1, Y, L2).

test :- zastap(malo, [lubie, malo, lodow, i, malo, smietany], duzo, L).
