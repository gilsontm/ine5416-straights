no(52, 
    no(32,
        no(12,nil,nil),
        no(35,nil,nil)), 
    no(56,
        no(55,
            no(55,nil,nil),
            nil),
        no(64,nil,nil))).

soma(nil, 0).
soma(no(N, ArvE, ArvD),Soma) :-
    soma(ArvE,SomaEsq),
    soma(ArvD,SomaDir),
    Soma is N + SomaEsq + SomaDir.

membro(N, no(N, _, _)) :- !.
membro(N, no(_, ArvE, ArvD)) :-
    membro(N, ArvE), !;
    membro(N, ArvD).

min(X,Y,X) :- X =< Y, !.
min(_,Y,Y).

minimo(nil,1000). %INF = 1000
minimo(no(N, ArvE, ArvD),Min) :-
    minimo(ArvE, MinE),
    minimo(ArvD, MinD),
    min(MinE, MinD, MinED),
    min(N, MinED, Min).

caminho(Y, no(Y, _, _), [Y]) :- !.
caminho(Y, no(K, ArvE, ArvD), [K|Caminho]) :-
    caminho(Y, ArvE, Caminho), !;
    caminho(Y, ArvD, Caminho).

ocorrencias(_, nil, 0).
ocorrencias(X, no(X, ArvE, ArvD), K) :-
    ocorrencias(X, ArvE, E), 
    ocorrencias(X, ArvD, D),
    K is E + D + 1.
ocorrencias(X, no(Y, ArvE, ArvD), K) :-
    X \= Y,
    ocorrencias(X, ArvE, E), 
    ocorrencias(X, ArvD, D),
    K is E + D.

% ?- no(X, E, D), ocorrencias(32, no(X, E, D), R).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% R = 1 ;
% false.

maiores(_, nil, 0).
maiores(X, no(Y, ArvE, ArvD), K) :-
    Y > X,
    maiores(X, ArvE, E), 
    maiores(X, ArvD, D),
    K is E + D + 1.
maiores(X, no(Y, ArvE, ArvD), K) :-
    Y =< X,
    maiores(X, ArvE, E), 
    maiores(X, ArvD, D),
    K is E + D.

% ?- no(X, E, D), maiores(32, no(X, E, D), R).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% R = 6 ;
% false.

tamanho(nil, 0).
tamanho(no(_, ArvE, ArvD), T) :-
    tamanho(ArvE, E),
    tamanho(ArvD, D),
    T is E + D + 1.

% ?- no(X, E, D), tamanho(no(X, E, D), T).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% T = 8.

media(nil, 0) :- !.
media(Arv, M) :- soma(Arv, S), tamanho(Arv, T), M is S / T.

% ?- no(X, E, D), media(no(X, E, D), M).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% M = 45.125.

% ?- media(nil, M).
% M = 0.

lista(nil, []).
lista(no(X, ArvE, ArvD), [X|L]) :-
    lista(ArvE, E),
    lista(ArvD, D),
    append(E, D, L).

% ?- no(X, E, D), lista(no(X, E, D), T).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% T = [52, 32, 12, 35, 56, 55, 55, 64].


nao_membro(_, nil).
nao_membro(N, no(X, ArvE, ArvD)) :-
    N \= X,
    nao_membro(N, ArvE),
    nao_membro(N, ArvD).

% ?- no(X, E, D), nao_membro(55, no(X, E, D)).
% false.

% ?- no(X, E, D), nao_membro(88, no(X, E, D)).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)) ;
% false.

pos_ordem(nil, []).
pos_ordem(no(X, ArvE, ArvD), R) :-
    pos_ordem(ArvE, E),
    pos_ordem(ArvD, D),
    append(E, D, L),
    append(L, [X], R).

% ?- no(X, E, D), pos_ordem(no(X, E, D), L).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% L = [12, 35, 32, 55, 55, 64, 56, 52].

pre_ordem(nil, []).
pre_ordem(no(X, ArvE, ArvD), R) :-
    pre_ordem(ArvE, E),
    pre_ordem(ArvD, D),
    append([X|E], D, R).

% ?- no(X, E, D), pre_ordem(no(X, E, D), L).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% L = [52, 32, 12, 35, 56, 55, 55, 64].

em_ordem(nil, []).
em_ordem(no(X, ArvE, ArvD), R) :-
    em_ordem(ArvE, E),
    em_ordem(ArvD, D),
    append(E, [X|D], R).

% ?- no(X, E, D), em_ordem(no(X, E, D), L).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% L = [12, 32, 35, 52, 55, 55, 56, 64].

quantidade_folhas(nil, 0).
quantidade_folhas(no(_, nil, nil), 1) :- !.
quantidade_folhas(no(_, ArvE, ArvD), L) :- 
    quantidade_folhas(ArvE, E),
    quantidade_folhas(ArvD, D),
    L is E + D.

% ?- no(X, E, D), quantidade_folhas(no(X, E, D), L).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% L = 4.

folhas(nil, []).
folhas(no(X, nil, nil), [X]) :- !.
folhas(no(_, ArvE, ArvD), L) :-
    folhas(ArvE, E),
    folhas(ArvD, D),
    append(E, D, L).

% ?- no(X, E, D), folhas(no(X, E, D), L).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% L = [12, 35, 55, 64].

iguais(nil, nil).
iguais(no(X, E1, D1), no(X, E2, D2)) :- iguais(E1, E2), iguais(D1, D2).

% ?- no(X, E, D), iguais(no(X, E, D), no(X, E, D)).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)).

% ?- no(X, E, D), iguais(no(X, E, D), nil).
% false.

max(X, Y, X) :- X >= Y, !.
max(_, Y, Y).

altura(nil, -1).
altura(no(_, ArvE, ArvD), R) :-
    altura(ArvE, E), altura(ArvD, D),
    max(E, D, L), R is L + 1.

% ?- no(X, E, D), altura(no(X, E, D), A).
% X = 52,
% E = no(32, no(12, nil, nil), no(35, nil, nil)),
% D = no(56, no(55, no(55, nil, nil), nil), no(64, nil, nil)),
% A = 3.
