posicao(X, [X|_], P) :- P is 0.
posicao(X, [_|T], P) :- posicao(X, T, PT), P is PT + 1.

% ?- posicao(1, [2,3,1,4,1], C).
% C = 2 ;
% C = 4 ;
% false.

% ?- posicao(1, [2,3,4], C).
% false.
