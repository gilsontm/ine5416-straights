inserirElementoPosicao(X, 0, L1, [X|L1]).
inserirElementoPosicao(X, P, [H|T], [H|L2]) :- PT is P - 1, inserirElementoPosicao(X, PT, T, L2).

% ?- inserirElementoPosicao(1, 2, [2,2,3], L2).
% L2 = [2, 2, 1, 3] ;
% false.

% ?- inserirElementoPosicao(1, 80, [2,2,3], L2).
% false.

% ?- inserirElementoPosicao(1, 0, [], L2).
% L2 = [1] ;
% false.
