% Não funcional.

:- use_module(library(clpfd)).

turista(cristian).
turista(ederson).
turista(henrique).
turista(rafael).

cidade(orlando).
cidade(lasvegas).
cidade(newyork).
cidade(saofrancisco).

duracao(10).
duracao(15).
duracao(20).
duracao(25).

hotel(bestprice).
hotel(bigpalace).
hotel(gardenflowers).
hotel(nicesprings).

todosDiferentes([]).
todosDiferentes([H|T]) :- not(member(H, T)), todosDiferentes(T).

solucao(Lista) :-
    Lista = [
        viagem(Turista1, Cidade1, Duracao1, Hotel1),
        viagem(Turista2, Cidade2, Duracao2, Hotel2),
        viagem(Turista3, Cidade3, Duracao3, Hotel3),
        viagem(Turista4, Cidade4, Duracao4, Hotel4)
    ],

    % o turista que viajará 20 dias ficará no hotel Big Palace.
    member(viagem(_, _, 20, bigpalace), Lista),

    % quem ficará no hotel Best Price é o turista Cristian ou 
    % o turista que viajará por 10 dias.
    (
        member(viagem(cristian, _, _, bestprice), Lista);
        member(viagem(_, _, 10, bestprice), Lista)
    ),

    % sobre o turista que vai para Orlando e o que ficará no hotel Nice
    % Springs, um vai viajar durante 20 dias e o outro se chama Henrique.
    (
        (
            member(viagem(henrique, orlando, _, _), Lista),
            member(viagem(_, _, 20, nicesprings), Lista)
        );
        (
            member(viagem(henrique, _, 20, _), Lista),
            member(viagem(_, orlando, _, nicesprings), Lista)
        )
    ),

    % o turista que vai para New York ficará 10 dias a mais que Rafael.
    member(viagem(rafael, _, D1, _), Lista),
    member(viagem(_, newyork, D2, _), Lista),
    duracao(D1), duracao(D2),
    D2 #= D1 + 10,

    % henrique viajará 5 dias a menos que o turista que vai para São Francisco.
    member(viagem(_, saofrancisco, D3, _), Lista),
    member(viagem(henrique, _, D4, _), Lista),
    duracao(D3), duracao(D4),
    D4 #= D3 - 5,

    turista(Turista1), turista(Turista2), turista(Turista3), turista(Turista4),
    todosDiferentes([Turista1, Turista2, Turista3, Turista4]),

    cidade(Cidade1), cidade(Cidade2), cidade(Cidade3), cidade(Cidade4),
    todosDiferentes([Cidade1, Cidade2, Cidade3, Cidade4]),

    duracao(Duracao1), duracao(Duracao2), duracao(Duracao3), duracao(Duracao4),
    todosDiferentes([Duracao1, Duracao2, Duracao3, Duracao4]),

    hotel(Hotel1), hotel(Hotel2), hotel(Hotel3), hotel(Hotel4),
    todosDiferentes([Hotel1, Hotel2, Hotel3, Hotel4]).
