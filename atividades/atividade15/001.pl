genitor(pam, bob).
genitor(tom, bob).
genitor(tom, liz).

genitor(bob, ana).
genitor(bob, pat).

genitor(liz,bill).

genitor(pat, jim).

mulher(pam).
mulher(liz).
mulher(pat).
mulher(ana).
homem(tom).
homem(bob).
homem(jim).
homem(bill).

pai(X,Y) :- genitor(X,Y), homem(X).
mae(X,Y) :- genitor(X,Y), mulher(X).

avo(AvoX, X) :- genitor(GenitorX, X), genitor(AvoX, GenitorX), homem(AvoX).
avoh(AvohX, X) :- genitor(GenitorX, X), genitor(AvohX, GenitorX), mulher(AvohX).
irmao(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, homem(X).
irma(X,Y) :- genitor(PaiAmbos, X), genitor(PaiAmbos, Y), X \== Y, mulher(X).
irmaos(X,Y) :- (irmao(X,Y); irma(X,Y)), X \== Y.

ascendente(X,Y) :- genitor(X,Y). % recursão - caso base
ascendente(X,Y) :- genitor(X, Z), ascendente(Z, Y). % recursão - passo recursivo

tio(X, Y) :- irmao(X, Z), genitor(Z, Y).
tia(X, Y) :- irma(X, Z), genitor(Z, Y).
tios(X, Y) :- tio(X,Y); tia(X,Y).
% ?- tio(X, Y).
% X = bob,
% Y = bill ;
% false.

primo(X, Y) :- genitor(Z, X), tios(Z, Y), homem(X).
prima(X, Y) :- genitor(Z, X), tios(Z, Y), mulher(X).
primos(X, Y) :- primo(X, Y); prima(X, Y).
% ?- prima(X, Y).
% X = ana,
% Y = bill ;
% X = pat,
% Y = bill ;
% false.

bisavo(X, Y) :- genitor(X, Z), (avo(Z, Y); avoh(Z, Y)), homem(X).
bisavoh(X, Y) :- genitor(X, Z), (avo(Z, Y); avoh(Z, Y)), mulher(X).
% ?- bisavo(X, Y).
% X = tom,
% Y = jim ;
% false.

descendente(X, Y) :- ascendente(Y, X).
% ?- descendente(bill, Y).
% Y = liz ;
% Y = tom ;
% false.

% ?- descendente(jim, Y).
% Y = pat ;
% Y = pam ;
% Y = tom ;
% Y = bob ;
% false.

feliz(X) :- genitor(X, _).
% ?- feliz(pat).
% true.

% ?- feliz(bill).
% false.
