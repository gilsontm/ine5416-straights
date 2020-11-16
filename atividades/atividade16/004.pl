soma([], 0).
soma([H|T], S) :- soma(T, SS), S is SS + H.

% ?- soma([1,2,3,4,5],L).
% L = 15.

% ?- soma([],L).
% L = 0.
