menor([H], H).
menor([H|T], M) :- menor(T, MM), H <  MM, M is H.
menor([H|T], M) :- menor(T, MM), H >= MM, M is MM.

maior([H], H).
maior([H|T], M) :- maior(T, MM), H >  MM, M is H.
maior([H|T], M) :- maior(T, MM), H =< MM, M is MM.

diferencaMaiorMenor([], 0).
diferencaMaiorMenor(L, D) :- maior(L, MM), menor(L, M), D is MM - M.

% ?- diferencaMaiorMenor([1,2,3,4,5], X).
% X = 4 ;
% false.

% ?- diferencaMaiorMenor([1], X).
% X = 0 ;
% false.

% ?- diferencaMaiorMenor([], X).
% X = 0 ;
% false.
