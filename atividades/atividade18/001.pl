pontos(1, ponto(0,0)).
pontos(2, ponto(1,0)).
pontos(3, ponto(0,1)).
pontos(4, ponto(1,1)).
pontos(5, ponto(1,2)).
pontos(6, ponto(2,3)).

distancia(ponto(X1, Y1), ponto(X2, Y2), R) :- R is sqrt((X1 - X2)**2 + (Y1 - Y2)**2).

% ?- pontos(1, A), pontos(4, B), distancia(A, B, R).
% A = ponto(0, 0),
% B = ponto(1, 1),
% R = 1.4142135623730951.

% ?- pontos(1, A), pontos(2, B), distancia(A, B, R).
% A = ponto(0, 0),
% B = ponto(1, 0),
% R = 1.0.

colineares(ponto(X1, Y1), ponto(X2, Y2), ponto(X3, Y3)) :- X1*Y2+X2*Y3+X3*Y1-X1*Y3-X2*Y1-X3*Y2 =:= 0.

% ?- pontos(1, A), pontos(2, B), pontos(3, C), colineares(A, B, C).
% false.

% ?- pontos(2, A), pontos(4, B), pontos(5, C), colineares(A, B, C).
% A = ponto(1, 0),
% B = ponto(1, 1),
% C = ponto(1, 2).

formaTriangulo(P1, P2, P3) :- 
    not(colineares(P1, P2, P3)),
    distancia(P1,P2,D12),
    distancia(P1,P3,D13),
    distancia(P2,P3,D23),
    D12 + D13 > D23,
    D13 + D23 > D12,
    D12 + D23 > D13.

% ?- pontos(2, A), pontos(4, B), pontos(5, C), formaTriangulo(A, B, C).
% false.

% ?- pontos(1, A), pontos(5, B), pontos(6, C), formaTriangulo(A, B, C).
% A = ponto(0, 0),
% B = ponto(1, 2),
% C = ponto(2, 3).
