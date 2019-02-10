/*

*/

znajdz(_, [], _) :-
    !,
    fail.

znajdz(1, [X|_], X) :-
    !.

znajdz(N, [_|O], X) :-
    M is N-1,
    znajdz(M, O, X).
