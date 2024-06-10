:- op(600, fy, 'asin').
:- op(600, fy, 'acos').
:- op(600, fy, 'atan').

% operacoes trigonometricas
:- op(600, fy, 'sin').
:- op(600, fy, 'cos').
:- op(600, fy, 'tan').

% operacoes basicas
:- op(500, yfx, '+'). 
:- op(500, yfx, '-').
:- op(400, yfx, '*').
:- op(400, yfx, '/').

% exponenciacao
:- op(300, yfx, '**').
:- op(300, fy, 'log').
:- op(600, fy, 'ln').

mono_operation(Term1, Result) :-
    parsing(Term1, Remainder),
    atom_concat(Remainder, ')', Result).

double_operation(Term1, Term2, Result) :-
    parsing(Term1, Resto1),
    parsing(Term2, Resto2),
    atom_concat(Resto1, ',', R1),
    atom_concat(R1, Resto2, R2),
    atom_concat(R2, ')', Result).
% 

parsing(sin(Term1), Result) :-
    mono_operation(Term1, R),
    atom_concat('operacao(sin,', R, Result).

parsing(cos(Term1), Result) :-
    mono_operation(Term1, R),
    atom_concat('operacao(cos,', R, Result).

parsing(tan(Term1), Result) :-
    mono_operation(Term1, R),
    atom_concat('operacao(tan,', R, Result).

parsing(asin(Term1), Result) :-
    mono_operation(Term1, R),
    atom_concat('operacao(asin,', R, Result).

parsing(acos(Term1), Result) :-
    mono_operation(Term1, R),
    atom_concat('operacao(acos,', R, Result).

parsing(atan(Term1), Result) :-
    mono_operation(Term1, R),
    atom_concat('operacao(atan,', R, Result).

parsing(Term1 + Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(soma,', R, Result).

parsing(Term1 - Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(subtracao,', R, Result).

parsing(Term1 / Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(divisao,', R, Result).

parsing(Term1 * Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(multiplicacao,', R, Result).

parsing(Term1 ** Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(elevado,', R, Result).

parsing(log(Term1, Term2), Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(log,', R, Result).   

parsing(ln(Term1), Result) :-
    mono_operation(Term1, R),
    atom_concat('operacao(ln,', R, Result).
%

silent_mono_operation(Term1, Result) :-
    silent_parsing(Term1, Remainder),
    atom_concat(Remainder, ')', Result).

silent_double_operation(Term1, Term2, Result) :-
    silent_parsing(Term1, Resto1),
    silent_parsing(Term2, Resto2),
    atom_concat(Resto1, ',', R1),
    atom_concat(R1, Resto2, R2),
    atom_concat(R2, ')', Result).
% 

silent_parsing(sin(Term1), Result) :-
    silent_mono_operation(Term1, R),
    atom_concat('silent_operacao(sin,', R, Result).

silent_parsing(cos(Term1), Result) :-
    silent_mono_operation(Term1, R),
    atom_concat('silent_operacao(cos,', R, Result).
    
silent_parsing(tan(Term1), Result) :-
    silent_mono_operation(Term1, R),
    atom_concat('silent_operacao(tan,', R, Result).

silent_parsing(asin(Term1), Result) :-
    silent_mono_operation(Term1, R),
    atom_concat('silent_operacao(asin,', R, Result).

silent_parsing(acos(Term1), Result) :-
    silent_mono_operation(Term1, R),
    atom_concat('silent_operacao(acos,', R, Result).

silent_parsing(atan(Term1), Result) :-
    silent_mono_operation(Term1, R),
    atom_concat('silent_operacao(atan,', R, Result).

silent_parsing(Term1 + Term2, Result) :-
    silent_double_operation(Term1, Term2, R),
    atom_concat('silent_operacao(soma,', R, Result).

silent_parsing(Term1 - Term2, Result) :-
    silent_double_operation(Term1, Term2, R),
    atom_concat('silent_operacao(subtracao,', R, Result).

silent_parsing(Term1 / Term2, Result) :-
    silent_double_operation(Term1, Term2, R),
    atom_concat('silent_operacao(divisao,', R, Result).

silent_parsing(Term1 * Term2, Result) :-
    silent_double_operation(Term1, Term2, R),
    atom_concat('silent_operacao(multiplicacao,', R, Result).
    
silent_parsing(Term1 ** Term2, Result) :-
    silent_double_operation(Term1, Term2, R),
    atom_concat('silent_operacao(elevado,', R, Result).

silent_parsing(log(Term1, Term2), Result) :-
    silent_double_operation(Term1, Term2, R),
    atom_concat('silent_operacao(log,', R, Result).

silent_parsing(ln(Term1), Result) :-
    silent_mono_operation(Term1, R),
    atom_concat('silent_operacao(ln,', R, Result).  
% 

:- discontiguous parsing/2.
parsing(Term, R) :-
    atomic(Term),
    R = Term. 
% 
:- discontiguous silent_parsing/2.
silent_parsing(Term, R) :-
    atomic(Term),
    R = Term. 
% 

prepare_tree(Tree, Resultado) :-
    !,
    atom_chars(Tree, Chars),
    append(Inicio, [_], Chars), % Separando a lista de caracteres em duas partes: Início (todos os caracteres exceto o último) e Último
    append(Inicio, [',', 'R', ')', '.'], NovosChars), % Adicionando 'ab' no final de Início
    atom_chars(Resultado, NovosChars). % Convertendo a lista de caracteres de volta para um átomo
    
    