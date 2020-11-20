% Trabalho III : Resolver de Straights (Str8s)
% Disciplina   : INE5416 - Paradigmas de Programacao
% Autor        : Gilson Trombetta Magro


:- use_module(library(clpfd)).

% | a regra 'colours' recebe uma lista de valores ou variaveis de dominio
% | e divide-a em dois grupos: casas brancas e casas negras.
% |
% | @parametros: (Numbers, Colours, Blacks, Whites)
% |     >Numbers: lista que representa os numeros do tabuleiro.
% |     >Colours: lista que representa as cores das casas do tabuleiro.
% |     >Blacks: lista de casas negras.
% |     >Whites: lista de casas brancas.
colours([], [], [], []).
colours([N|Ns], [C|Cs], Bs, [N|Ws]) :- C #= 1, colours(Ns, Cs, Bs, Ws).
colours([N|Ns], [C|Cs], [N|Bs], Ws) :- C #= 0, colours(Ns, Cs, Bs, Ws).

% | a regra 'no_zeros' recebe uma lista de valores ou variaveis de dominio
% | e define uma outra lista composta dos mesmos valores da primeira lista,
% | exceto daqueles que sao iguais a zero.
% |
% | @parametros: (Numbers, NoZeros)
% |     >Numbers: lista de valores ou variaveis de dominio.
% |     >NoZeros: lista Numbers, porem sem os valores iguais a zero.
no_zeros([], []).
no_zeros([H|T], [H|R]) :- H #\= 0, no_zeros(T, R).
no_zeros([H|T], R)     :- H #=  0, no_zeros(T, R).

% | a regra 'no_repeats' é verdadeira sse os valores diferentes de zero
% | na lista Numbers sao todos diferentes entre si.
% |
% | @parametros: (Numbers)
% |     >Numbers: lista de valores ou variaveis de dominio.
no_repeats(Numbers) :- no_zeros(Numbers, NoZeros), all_distinct(NoZeros).

% | a regra 'regions' recebe uma linha ou coluna do tabuleiro,
% | constroi as regioes que esta linha ou coluna engloba, e eh
% | verdadeira somente se as regioes construidas sao conjuntos consecutivos.
% |
% | @parametros: (Limit, Numbers, Colours, Region)
% |     >Limit: limite superior para os valores de uma regiao;
% |             corresponde ao tamanho do tabuleiro.
% |     >Numbers: lista de valores ou variaveis de dominio de uma linha/coluna.
% |     >Colours: lista de cores das casas de uma linha/coluna.
% |     >Region: corresponde aa regiao que esta sendo construida naquele momento.
regions(L, Ns, Cs)             :- regions(L, Ns, Cs, []).
regions(L, [], [], Rs)         :- consecutive(Rs, L).
regions(L, [N|Ns], [1|Cs], Rs) :- regions(L, Ns, Cs, [N|Rs]).
regions(L, [_|Ns], [0|Cs], Rs) :- consecutive(Rs, L), regions(L, Ns, Cs, []).

% | a regra 'consecutive' recebe um conjunto de valores ou variaveis de dominio
% | e eh verdadeira sse o conjunto forma uma sequencia de valores consecutivos.
% |
% | @parametros: (Set, Limit)
% |     >Set: conjunto de valores ou variaveis de dominio.
% |     >Limit: limite superior para os valores do conjunto;
% |             corresponde ao tamanho do tabuleiro.
consecutive([], _) :- !.
consecutive([_], _) :- !.
consecutive(Set, Limit) :-
    length(Set, Length),
    Range #= Limit - Length + 1,
    LowerBound in 1..Range,
    indomain(LowerBound),
    UpperBound #= LowerBound + Length - 1,
    Set ins LowerBound..UpperBound.

% | a regra 'solve' recebe um tabuleiro e resolve-o.
% |
% | @parametros: (NumberRows, ColourRows)
% |     >NumberRows: matriz que representa os numeros do tabuleiro.
% |     >ColourRows: matriz que representa as cores do tabuleiro.
solve(NumberRows, ColourRows) :-
    % devemos garantir que o tabuleiro seja quadrado e devidamente
    % representado pelas matrizes de numeros e cores.
    length(NumberRows, Length),
    length(ColourRows, Length),
    maplist(same_length(NumberRows), NumberRows),
    maplist(same_length(ColourRows), ColourRows),
    % entao, concatena-se todas as linhas do tabuleiro em uma única lista.
    append(NumberRows, FlatNumbers),
    append(ColourRows, FlatColours),
    % as cores das casas devem ser valores binarios (zero ou um).
    FlatColours ins 0..1,
    % separa-se as casas em casas brancas e casas negras, e a cada
    % conjunto eh designado seu respectivo dominio.
    colours(FlatNumbers, FlatColours, Blacks, Whites),
    Blacks ins 0..Length,
    Whites ins 1..Length,
    % transpoe-se o tabuleiro para que seja facil referencias as colunas.
    transpose(NumberRows, NumberCols),
    transpose(ColourRows, ColourCols),
    % na solucao final, linhas e colunas nao podem conter numeros repetidos.
    maplist(no_repeats, NumberRows),
    maplist(no_repeats, NumberCols),
    % por fim, as regioes horizontais e verticais devem ser levadas em conta.
    maplist(regions(Length), NumberRows, ColourRows),
    maplist(regions(Length), NumberCols, ColourCols).

% | a regra 'solve_all' encapsula a regra 'solve' e facilita a
% | visualizacao dos resultados.
% |
% | @parametros: (Numbers, Colours)
% |     >Numbers: matriz que representa os numeros do tabuleiro.
% |     >Colours: matriz que representa as cores do tabuleiro.
solve_all(Numbers, Colours) :-
    solve(Numbers, Colours),
    maplist(label, Numbers),
    nl,
    write_board(Numbers, Colours).

% | a regra 'write_board' imprime um tabuleiro.
% |
% | @parametros: (Numbers, Colours)
% |     >Numbers: matriz que representa os numeros do tabuleiro.
% |     >Colours: matriz que representa as cores do tabuleiro.
write_board([], []) :- nl.
write_board([N|Ns], [C|Cs]) :- write_row(N, C), write_board(Ns, Cs).

% | a regra 'write_row' imprime uma linha do tabuleiro.
% |
% | @parametros: (Numbers, Colours)
% |     >Numbers: lista que representa os numeros de uma linha do tabuleiro.
% |     >Colours: lista que representa as cores de uma linha do tabuleiro.
write_row([], []) :- nl.
write_row([N|Ns], [C|Cs]) :- C #= 1, format(" ~w ", N), write_row(Ns, Cs).
write_row([N|Ns], [C|Cs]) :- C #= 0, format("[~w]", N), write_row(Ns, Cs).
