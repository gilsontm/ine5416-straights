primeiros(0, _, []).
primeiros(N, [H|T], [H|TT]) :- NN is N - 1, primeiros(NN, T, TT).

% ?- primeiros(3, [1,2,3,4,5], L).
% L = [1, 2, 3] ;
% false.

% ?- primeiros(0, [1,2,3,4,5], L).
% L = [] ;
% false.

% ?- primeiros(9, [1,2,3,4,5], L).
% false.

% ?- primeiros(1, [], L).
% false.

% ?- primeiros(0, [], L).
% L = [] ;
% false.
