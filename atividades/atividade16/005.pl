soma([], 0).
soma([H|T], S) :- soma(T, SS), S is SS + H.

comprimento([], 0).
comprimento([_|T], C) :- comprimento(T, CT), C is CT + 1.

media([], 0).
media(L, X) :- soma(L, S), comprimento(L, C), X is (S / C).

% ?- media([10,10,10], X).
% X = 10.

% ?- media([10,10,0], X).
% X = 6.666666666666667.

% ?- media([10,0,0], X).
% X = 3.3333333333333335.

% ?- media([10,0,999], X).
% X = 336.3333333333333.
