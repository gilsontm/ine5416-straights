aluno(ana).
aluno(bruno).
aluno(carlos).
aluno(douglas).

professor(elena).
professor(fabio).
professor(gabriel).
professor(hamilton).

disciplina(ine1111).
disciplina(ine2222).
disciplina(ine3333).
disciplina(ine4444).

leciona(elena, ine1111).
leciona(elena, ine2222).
leciona(fabio, ine1111).
leciona(gabriel, ine3333).
leciona(gabriel, ine4444).
leciona(hamilton, ine2222).
leciona(hamilton, ine4444).

estuda(ana, ine1111).
estuda(ana, ine2222).
estuda(ana, ine3333).
estuda(ana, ine4444).
estuda(bruno, ine2222).
estuda(bruno, ine3333).
estuda(carlos, ine1111).
estuda(carlos, ine2222).
estuda(carlos, ine3333).
estuda(douglas, ine3333).
estuda(douglas, ine4444).

ensina(X, Y) :- professor(X), aluno(Y), leciona(X, Z), estuda(Y, Z), disciplina(Z).
% ?- ensina(elena, bruno).
% true.

% ?- ensina(elena, douglas).
% false.

colegas(X, Y) :- aluno(X), aluno(Y), estuda(X, Z), estuda(Y, Z), X \== Y, disciplina(Z).
% ?- colegas(ana, bruno).
% true ;
% true ;
% false.

% ?- colegas(ana, douglas).
% true ;
% true.

disciplinas(X, Z) :- professor(X), leciona(X, Z), disciplina(Z).
% ?- disciplinas(elena, X).
% X = ine1111 ;
% X = ine2222.

alunos(X, Z) :- professor(X), aluno(Z), ensina(X, Z).
% ?- alunos(fabio, X).
% X = ana ;
% X = carlos ;
% false.
