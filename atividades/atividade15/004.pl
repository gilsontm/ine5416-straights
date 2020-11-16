triangulo(X, Y, Z) :- (X + Y > Z), (X + Z > Y), (Y + Z > X).
triangulo(X, Y, Z) :- (X + Y > Z), (X + Z > Y), (Y + Z > X).

% ?- triangulo(4,5,6).
% true.

% ?- triangulo(4,5,1).
% false.
