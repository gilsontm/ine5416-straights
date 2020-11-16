elemento(X, [H|T]) :- X == H; elemento(H, T).

uniao([], [], []).
uniao([H1|T1], [H2|T2], [H1,H2|T]) :- uniao(T1, T2, T), not(elemento(H1, T)), not(elemento(H2, T)), H1 \== H2.
uniao([H1|T1], [H2|T2], [H1|T]   ) :- uniao(T1, T2, T), not(elemento(H1, T)), not(elemento(H2, T)), H1  == H2.
uniao([H1|T1], [H2|T2], [H1|T]   ) :- uniao(T1, T2, T), not(elemento(H1, T)),     elemento(H2, T) .
uniao([H1|T1], [H2|T2], [H2|T]   ) :- uniao(T1, T2, T),     elemento(H1, T) , not(elemento(H2, T)).
uniao([H1|T1], [H2|T2], T        ) :- uniao(T1, T2, T),     elemento(H1, T) ,     elemento(H2, T) .
uniao([H1|T1], []     , [H1|T]   ) :- uniao(T1, [], T), not(elemento(H1, T)).
uniao([H1|T1], []     , T        ) :- uniao(T1, [], T),     elemento(H1, T).
uniao([]     , [H2|T2], [H2|T]   ) :- uniao([], T2, T), not(elemento(H2, T)).
uniao([]     , [H2|T2], T        ) :- uniao([], T2, T),     elemento(H2, T).

% ?- uniao([1,2,3],[1,2,8,9,9],L).
% L = [1, 2, 3, 8, 9] .

% ?- uniao([1,2,3],[1,2,8,9,9],L).
% L = [1, 2, 3, 8, 9] ;
% false.

% ?- uniao([1,2,3],[],L).
% L = [1, 2, 3] ;
% false.

% ?- uniao([],[],L).
% L = [] ;
% false.

% ?- uniao([1,2],[1,2],L).
% L = [1, 2] ;
% false.
