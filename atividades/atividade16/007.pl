
separarUltimoElemento([H], [], H).
separarUltimoElemento([H|T], [H|TT], P) :- separarUltimoElemento(T, TT, P).

palindrome([]) :- !.
palindrome([_]) :- !.
palindrome([H,H]) :- !.
palindrome([H|T]) :- separarUltimoElemento(T, TT, P), P == H, palindrome(TT).

% ?- palindrome([1,2,2,1]).
% true ;
% false.

% ?- palindrome([1,2,1]).
% true ;
% false.

% ?- palindrome([]).
% true.

% ?- palindrome([1,5,1,5,1]).
% true ;
% false.

% ?- palindrome([1,1,1]).
% true ;
% false.

% ?- palindrome([1,1,2,1]).
% false.
