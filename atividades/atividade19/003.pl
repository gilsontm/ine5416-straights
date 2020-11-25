dado(1).
dado(2).
dado(3).
dado(4).
dado(5).
dado(6).

todosDados([]).
todosDados([H|T]) :- dado(H), todosDados(T).

solucao(Quantidade, Resultado) :-
    length(Resultado, Quantidade),
    todosDados(Resultado).

% ?- solucao(2, R).
% R = [1, 1] ;
% R = [1, 2] ;
% R = [1, 3] ;
% R = [1, 4] ;
% R = [1, 5] ;
% R = [1, 6] ;
% R = [2, 1] ;
% R = [2, 2] ;
% R = [2, 3] ;
% R = [2, 4] ;
% R = [2, 5] ;
% R = [2, 6] ;
% R = [3, 1] ;
% R = [3, 2] ;
% R = [3, 3] ;
% R = [3, 4] ;
% R = [3, 5] ;
% R = [3, 6] ;
% R = [4, 1] ;
% R = [4, 2] ;
% R = [4, 3] ;
% R = [4, 4] ;
% R = [4, 5] ;
% R = [4, 6] ;
% R = [5, 1] ;
% R = [5, 2] ;
% R = [5, 3] ;
% R = [5, 4] ;
% R = [5, 5] ;
% R = [5, 6] ;
% R = [6, 1] ;
% R = [6, 2] ;
% R = [6, 3] ;
% R = [6, 4] ;
% R = [6, 5] ;
% R = [6, 6].
