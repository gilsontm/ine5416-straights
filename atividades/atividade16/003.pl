numerosParaPalavras([], []).
numerosParaPalavras([0|T], ['zero'  |TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([1|T], ['um'    |TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([2|T], ['dois'  |TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([3|T], ['tres'  |TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([4|T], ['quatro'|TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([5|T], ['cinco' |TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([6|T], ['seis'  |TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([7|T], ['sete'  |TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([8|T], ['oito'  |TT]) :- numerosParaPalavras(T, TT).
numerosParaPalavras([9|T], ['nove'  |TT]) :- numerosParaPalavras(T, TT).

% ?- numerosParaPalavras([1,2,0,3,5,4,9], L).
% L = [um, dois, zero, tres, cinco, quatro, nove] ;
% false.

% ?- numerosParaPalavras([], L).
% L = [].

% ?- numerosParaPalavras([10, 11, 12], L).
% false.
