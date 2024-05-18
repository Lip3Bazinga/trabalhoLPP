:- consult('is_op.pl').
% :- consult('evaluate_ast.pl').

:- op(600, fy, 'sin').

% operacoes basicas
:- op(500, yfx, '+'). 
:- op(500, yfx, '-').
:- op(400, yfx, '*').
:- op(400, yfx, '/').

% exponenciacao
:- op(300, yfx, '**').

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

parsing(Term, R) :-
    (is_operation(Term);
    atomic(Term)),
    R = Term.

parsing(sin(Term1), Result) :-
    mono_operation(Term1, R),
    atom_concat('operacao(sin,', R, Result).

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



silent_parsing(Term, R) :-
    (is_operation(Term);
    atomic(Term)),
    R = Term.

silent_parsing(sin(Term1), Result) :-
    silent_mono_operation(Term1, R),
    atom_concat('silent_operacao(sin,', R, Result).

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
     
% 
prepare_tree(Tree, Resultado) :-
    !,
    atom_chars(Tree, Chars),
    append(Inicio, [_], Chars), % Separando a lista de caracteres em duas partes: Início (todos os caracteres exceto o último) e Último
    append(Inicio, [',', 'R', ')', '.'], NovosChars), % Adicionando 'ab' no final de Início
    atom_chars(Resultado, NovosChars). % Convertendo a lista de caracteres de volta para um átomo
    
