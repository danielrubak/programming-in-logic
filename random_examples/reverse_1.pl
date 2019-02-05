reverse([], Rev, Rev).
reverse([H|T], Temp, Rev) :-
  reverse(T, [H|Temp], Rev).

% ?- reverse([ants, mice, zebras], [], X).
% X = [zebras, mice, ants]