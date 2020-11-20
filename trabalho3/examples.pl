% Trabalho III : Resolver de Straights (Str8s)
% Disciplina   : INE5416 - Paradigmas de Programacao
% Autor        : Gilson Trombetta Magro


% | a regra 'board' apenas define alguns tabuleiros que servem de exemplo
% | para as regras 'solve' e 'solve_all'.
% |
% | @parametros (Id, Numbers, Colours)
% |     >Id: identificador do tabuleiro.
% |     >Numbers: matriz que representa os numeros do tabuleiro.
% |     >Colours: matriz que representa as cores do tabuleiro.
board(1,
    [[1,_,_],
     [_,0,_],
     [_,_,1]],
    [[1,1,1],
     [1,0,1],
     [1,1,1]]).

board(2,
    [[1,_,_,0],
     [_,1,_,_],
     [2,0,0,_],
     [_,_,4,_]],
    [[1,1,1,0],
     [1,0,1,1],
     [1,0,0,1],
     [1,1,1,1]]).

board(3,
    [[4,3,0,1],
     [_,_,_,_],
     [_,0,_,_],
     [_,_,_,_]],
    [[1,1,0,1],
     [1,1,1,1],
     [1,0,1,1],
     [1,1,1,1]]).

board(4,
    [[3,2,1,4],
     [2,1,0,3],
     [1,3,4,2],
     [4,0,2,1]],
    [[1,1,1,1],
     [1,_,_,1],
     [1,1,1,1],
     [1,_,_,1]]).

board(5, % Fonte: https://www.janko.at/Raetsel/Straights/007.a.htm
    [[9,6,8,1,_,_,_,4,_],
     [_,_,0,0,4,_,_,7,0],
     [5,0,0,_,3,_,0,0,_],
     [_,0,_,_,_,4,6,_,_],
     [0,_,_,_,0,_,_,_,0],
     [3,_,0,_,5,8,_,0,_],
     [_,0,0,_,_,_,0,5,_],
     [0,0,5,_,_,0,4,1,_],
     [_,7,_,_,_,_,_,_,1]],
    [[0,1,1,1,1,1,1,1,1],
     [1,1,0,0,1,1,1,0,0],
     [1,0,0,1,1,1,0,0,1],
     [1,0,1,1,1,1,0,1,1],
     [0,1,1,1,0,1,1,1,0],
     [1,1,0,1,1,1,1,0,1],
     [1,0,0,1,1,1,0,0,1],
     [0,0,1,1,1,0,0,1,1],
     [1,1,1,1,1,1,1,1,0]]).
