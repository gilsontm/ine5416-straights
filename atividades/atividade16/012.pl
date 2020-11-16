apagar(_, [], []) :- !.
apagar(0, L, L) :- !.
apagar(N, [_|T], TT) :- NN is N - 1, apagar(NN, T, TT).

% ?- apagar(0, [1,2,3,4,5], L).
% L = [1, 2, 3, 4, 5].

% ?- apagar(2, [1,2,3,4,5], L).
% L = [3, 4, 5].

% ?- apagar(0, [], L).
% L = [].

% ?- apagar(10, [1,2,3], L).
% L = [].
