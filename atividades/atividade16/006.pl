menor([], 0).
menor([H], H).
menor([H|T], M) :- menor(T, MM), H <  MM, M is H.
menor([H|T], M) :- menor(T, MM), H >= MM, M is MM.

% ?- menor([1,2,3,4,5,6,7,8,9], M).
% M = 1 ;
% M = 0.

% ?- menor([90, 20, 1, 3, 40], M).
% M = 1 ;
% M = 0.
