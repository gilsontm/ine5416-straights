dado(1).
dado(2).
dado(3).
dado(4).
dado(5).
dado(6).

todosDados([]).
todosDados([H|T]) :- dado(H), todosDados(T).

soma([], 0).
soma([H|T], SS) :- soma(T, S), SS is S + H.

solucao(Quantidade, Soma, Resultado) :-
    length(Resultado, Quantidade),
    todosDados(Resultado),
    soma(Resultado, Soma).

% ?- solucao(2, 4, R).
% R = [1, 3] ;
% R = [2, 2] ;
% R = [3, 1] ;
% false.

% ?- solucao(3, 10, R).
% R = [1, 3, 6] ;
% R = [1, 4, 5] ;
% R = [1, 5, 4] ;
% R = [1, 6, 3] ;
% R = [2, 2, 6] ;
% R = [2, 3, 5] ;
% R = [2, 4, 4] ;
% R = [2, 5, 3] ;
% R = [2, 6, 2] ;
% R = [3, 1, 6] ;
% R = [3, 2, 5] ;
% R = [3, 3, 4] ;
% R = [3, 4, 3] ;
% R = [3, 5, 2] ;
% R = [3, 6, 1] ;
% R = [4, 1, 5] ;
% R = [4, 2, 4] ;
% R = [4, 3, 3] ;
% R = [4, 4, 2] ;
% R = [4, 5, 1] ;
% R = [5, 1, 4] ;
% R = [5, 2, 3] ;
% R = [5, 3, 2] ;
% R = [5, 4, 1] ;
% R = [6, 1, 3] ;
% R = [6, 2, 2] ;
% R = [6, 3, 1] ;
% false.
