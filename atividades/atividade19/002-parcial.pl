% Não funcional (incompleto).

:- use_module(library(clpfd)).

sum([], 0).
sum([H|T], SS) :- sum(T, S), SS #= S + H.

singlequeen(List) :-  sum(List, 0); sum(List, 1).

solution(Rows, Queens) :-
    maplist(same_length(Rows), Rows),
    append(Rows, Flat), Flat ins 0..1,
    sum(Flat, Queens),
    transpose(Rows, Cols),
    maplist(singlequeen, Rows),
    maplist(singlequeen, Cols).

board(1, [[_, _, _],
          [_, _, _],
          [_, _, _]]).
