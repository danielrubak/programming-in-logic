naive_reverse([],[]).
naive_reverse([H|T],Rev):-
  naive_reverse(T,TR),
  append(TR,[H],Rev).

% ?- naive_reverse([ants, mice, zebras], X).
% X = [zebras, mice, ants]