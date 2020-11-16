ocorrencias([], _, 0).
ocorrencias([H|T], H, N) :- ocorrencias(T, H, NN), N is NN + 1.
ocorrencias([H|T], X, N) :- H \== X, ocorrencias(T, X, N).

% ?- ocorrencias([2,2,1,4,1], 1, N).
% N = 2 ;
% false.

% ?- ocorrencias([2,2], 1, N).
% N = 0.

% ?- ocorrencias([], 1, N).
% N = 0.
