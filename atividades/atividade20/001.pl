:- dynamic minimoMoedas/3. %define que fatos/regras na forma minimoMoedas(_,_) serão dinâmicos
:- retractall( minimoMoedas(_,_,_) ). %apaga quaisquer fatos/regras na forma minimoMoedas(_,_) previamente registrados

minimoMoedas(0,_,0) :- !.
minimoMoedas(N,Moedas,K) :-
    N > 0,
    findall(KResto, (member(Moeda, Moedas), Moeda =< N, Resto is N - Moeda, minimoMoedas(Resto,Moedas,KResto)), ListaKResto),
    min_list(ListaKResto, KMinResto), %Pega a que usar o menor número de moedas
    K is KMinResto + 1, %Soma 1 no total de moedas usadas
    asserta(minimoMoedas(N,Moedas,K) :- !). %Salva o resultado

% ?- minimoMoedas(110, [20,30,60], K).
% K = 3.

% ?- minimoMoedas(11, [1,5,6,8], K).
% K = 2.

% ?- minimoMoedas(1000, [35,150], K).
% K = 22.

% ?- minimoMoedas(2000, [35,150], K).
% K = 21.

% ?- minimoMoedas(2100, [35,150], K).
% K = 14.
