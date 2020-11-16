dividir([], [], []).
dividir([H], [H], []).
dividir([H1,H2|T], [H1|T1], [H2|T2]) :- dividir(T, T1, T2).

% ?- dividir([1,2,3,4,5],L1,L2).
% L1 = [1, 3, 5],
% L2 = [2, 4] ;
% false.

% ?- dividir([1,2,3,4,5,6],L1,L2).
% L1 = [1, 3, 5],
% L2 = [2, 4, 6].

% ?- dividir([1],L1,L2).
% L1 = [1],
% L2 = [] ;
% false.

% ?- dividir([],L1,L2).
% L1 = L2, L2 = [].
