separarUltimoElemento([H], [], H).
separarUltimoElemento([H|T], [H|TT], P) :- separarUltimoElemento(T, TT, P).

inverte([], []).
inverte(L, [P|TT]) :- separarUltimoElemento(L, T, P), inverte(T, TT).

% ?- inverte([1,2,3], L).
% L = [3, 2, 1] ;
% false.

% ?- inverte([], L).
% L = [] ;
% false.

% ?- inverte([1,2,4,5,6,7,8,10], L).
% L = [10, 8, 7, 6, 5, 4, 2, 1] ;
% false.
