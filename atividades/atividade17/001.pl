% Relacao de filmes
%    filme(id, titulo, ano, diretor, nacionalidade).
%
filme(f1, 'Monty Python: O Sentido da Vida', 1983, 'Terry Jones', uk).
filme(f2, 'Edukators', 2004, 'Hans Weingartner', de).
filme(f3, 'Lavoura Arcaica', 2001, 'Luiz Fernando Carvalho', br).
filme(f4, 'Lisbela e o Prisioneira', 2003, 'Guel Arraes', br).
filme(f5, 'Abril despedaçado', 2001, 'Walter Salles', br).
filme(f6, 'Diários de motocicleta', 2004, 'Walter Salles', br).

% Relacao de paises
%     pais(sigla, nome).
%
pais(uk, 'United Kingdom').
pais(de, 'Alemanha').
pais(br, 'Brasil').

% Relacao de DVD (a caixa em si)
%     dvd(id do DVD, id do filme, estante).
%
dvd(d1, f1, est1).
dvd(d2, f2, est1).
dvd(d4, f4, est1).
dvd(d3, f3, est2).
dvd(d5, f5, est3).
dvd(d6, f1, est1).
dvd(d7, f2, est4).
dvd(d8, f2, est4).

% Relacao de clientes
%     cliente(cod, nome, telefone).
%
cliente(c1, 'Bob', '333-3112').
cliente(c2, 'Zeca', '245-1099').
cliente(c3, 'Tom', '323-0685').
cliente(c4, 'Bianca', '333-4391').
cliente(c5, 'Alice', '251-7439').
cliente(c6, 'Maria', '212-3271').

% Relacao de locacoes
%     locacao(cod cliente, nro do DVD, data de entrega)
%
locacao(c1, d1, '2005-11-07').
locacao(c1, d2, '2005-11-07').
locacao(c3, d5, '2005-11-09').
locacao(c2, d3, '2005-11-10').
locacao(c3, d3, '2005-11-11').
locacao(c4, d8, '2005-11-12').
locacao(c5, d7, '2005-11-12').
locacao(c6, d6, '2005-11-12').
locacao(c1, d5, '2005-11-13').
locacao(c1, d6, '2005-11-13').
locacao(c6, d2, '2005-11-14').
locacao(c3, d7, '2005-11-14').
locacao(c3, d8, '2005-11-14').
locacao(c5, d1, '2005-11-15').


% a)
% ?- findall(T, (filme(_, T, D, _, _), D > 2001), FF).
% FF = ['Edukators', 'Lisbela e o Prisioneira', 'Diários de motocicleta'].

% b)
% ?- findall(T, (filme(_, T, D, _, _), D >= 2001, D =< 2004), FF).
% FF = ['Edukators', 'Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despedaçado', 'Diários de motocicleta'].

% c)
% ?- findall(T, filme(_, T, _, _, br), FF), sort(FF, FFF).
% FF = ['Lavoura Arcaica', 'Lisbela e o Prisioneira', 'Abril despedaçado', 'Diários de motocicleta'],
% FFF = ['Abril despedaçado', 'Diários de motocicleta', 'Lavoura Arcaica', 'Lisbela e o Prisioneira'].

% d)
% ?- findall(T, (filme(_, T, _, _, P), P \= br), FF), sort(FF, FFF).
% FF = ['Monty Python: O Sentido da Vida', 'Edukators'],
% FFF = ['Edukators', 'Monty Python: O Sentido da Vida'].

% e)
% ?- findall(direcao(T, Diretor), (filme(_, T, Data, Diretor, P), Data =< 2004, pais(P, 'Alemanha')), FF).
% FF = [direcao('Edukators', 'Hans Weingartner')].

% f)
% ?- findall(D, (dvd(D, F, _), filme(F, _, _, _, P), not(pais(P, 'Brasil'))),  DD).
% DD = [d1, d2, d6, d7, d8].

% g) 
% ?- findall(D, (dvd(D, F, est2), filme(F, _, _, _, P), pais(P, 'Brasil')),  DD).
% DD = [d3].

% h)
% ?- findall(Diretor, (dvd(D, F, est1), filme(F, _, _, Diretor, _)),  DD), sort(DD, DDD).
% DD = ['Terry Jones', 'Hans Weingartner', 'Guel Arraes', 'Terry Jones'],
% DDD = ['Guel Arraes', 'Hans Weingartner', 'Terry Jones'].

% i)
% ?- findall(T, (filme(F, T, _, _, _), not(dvd(_, F, _))), TT).
% TT = ['Diários de motocicleta'].

% j)
% ?- findall(N, ( (dvd(_, F, est1); dvd(_, F, est4)), filme(F, _, _, _, P), pais(P, N) ), NN).
% NN = ['United Kingdom', 'Alemanha', 'Brasil', 'United Kingdom', 'Alemanha', 'Alemanha'].

% k)
% ?- findall(N, (cliente(C, N, _), locacao(C, _, '2005-11-07')), NN).
% NN = ['Bob', 'Bob'].

% l)
% ?- findall(E, (dvd(D, _, E), locacao(_, D, _)), EE), sort(EE, EEE).
% EE = [est1, est1, est1, est1, est2, est2, est3, est3, est1|...],
% EEE = [est1, est2, est3, est4].

% m)
% ?- findall(T, (dvd(D, F, _), locacao(C, D, _), cliente(C, 'Maria', _), filme(F, T, _, _, _)), TT).
% TT = ['Edukators', 'Monty Python: O Sentido da Vida'].

% n)
% ?- findall(T, (dvd(D, F, _), locacao(C, D, _), cliente(C, 'Maria', _), filme(F, T, _, _, _)), TT), list_to_set(TT, TTT), length(TTT, L).
% TT = TTT, TTT = ['Edukators', 'Monty Python: O Sentido da Vida'],
% L = 2.

% o) 
% ?- bagof(T, D ^ F ^ _A ^ _B ^ _C ^ (dvd(D, F, E), filme(F, T, _A, _B, _C)), EE).
% E = est1,
% EE = ['Monty Python: O Sentido da Vida', 'Edukators', 'Lisbela e o Prisioneira', 'Monty Python: O Sentido da Vida'] ;
% E = est2,
% EE = ['Lavoura Arcaica'] ;
% E = est3,
% EE = ['Abril despedaçado'] ;
% E = est4,
% EE = ['Edukators', 'Edukators'].

% p)
% ?- findall(N, (locacao(C, D, '2005-11-07'), cliente(C, 'Bob', _), dvd(D, F, _), filme(F, T, _, _, P), pais(P, N)), NN).
% NN = ['United Kingdom', 'Alemanha'].

% q)
% ?- findall(F, (locacao(C, D, _), cliente(C, 'Bob', _), dvd(D, F, _), filme(F, _, _, _, P), pais(P, 'Brasil')), L1), list_to_set(L1, L2), length(L2, L).
% L1 = L2, L2 = [f5],
% L = 1.

% r)
% ?- setof(T, _A ^ _B ^ _C ^ _D ^ _E ^ D ^ F ^ (dvd(D, F, _A), locacao(C, D, _B), filme(F, T, _C, _D, _E)), L1).
% C = c1,
% L1 = ['Abril despedaçado', 'Edukators', 'Monty Python: O Sentido da Vida'] ;
% C = c2,
% L1 = ['Lavoura Arcaica'] ;
% C = c3,
% L1 = ['Abril despedaçado', 'Edukators', 'Lavoura Arcaica'] ;
% C = c4,
% L1 = ['Edukators'] ;
% C = c5,
% L1 = ['Edukators', 'Monty Python: O Sentido da Vida'] ;
% C = c6,
% L1 = ['Edukators', 'Monty Python: O Sentido da Vida'].

% s)
% ?- findall(T, (dvd(D, F, _), locacao(C1, D, _), locacao(C2, D, _), filme(F, T, _, _, _), cliente(C1, 'Zeca', _), cliente(C2, 'Tom', _)), L1).
% L1 = ['Lavoura Arcaica'].

% t)
% ?- findall(T, (dvd(D, F, _), filme(F, T, _, _, _), cliente(C1, 'Bob', _), cliente(C2, 'Maria', _), locacao(C1, D, _), not(locacao(C2, D, _))), L1), list_to_set(L1, L2).
% L1 = L2, L2 = ['Monty Python: O Sentido da Vida', 'Abril despedaçado'].

% u)
% ?- findall(T, (dvd(D, F, _), filme(F, T, _, _, _), cliente(C1, 'Bob', _), cliente(C2, 'Maria', _), not(locacao(C1, D, _)), not(locacao(C2, D, _))), L1), list_to_set(L1, L2).
% L1 = ['Lisbela e o Prisioneira', 'Lavoura Arcaica', 'Edukators', 'Edukators'],
% L2 = ['Lisbela e o Prisioneira', 'Lavoura Arcaica', 'Edukators'].
