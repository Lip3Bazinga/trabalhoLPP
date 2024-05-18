:- consult('is_op.pl'). 

:- op(600, fy, 'sin'). % Define a precedência das operações básicas

% operacoes basicas 
:- op(500, yfx, '+'). 
:- op(500, yfx, '-').
:- op(400, yfx, '*').
:- op(400, yfx, '/').

% exponenciacao
:- op(300, yfx, '**').

% Operação unitárica, tal qual o sen(x) = z
mono_operation(Term1, Result) :-
    parsing(Term1, Remainder),
    atom_concat(Remainder, ')', Result).

% Operação com dois argumentos, tal qual x+y = z
double_operation(Term1, Term2, Result) :-
    parsing(Term1, Resto1), 
    parsing(Term2, Resto2),
    atom_concat(Resto1, ',', R1),
    atom_concat(R1, Resto2, R2),
    atom_concat(R2, ')', Result).

parsing(Term, R) :-
    (is_operation(Term); % Verifica se a operação está no formato de árvore
    atomic(Term)), % Verifica se ela é um átomo
    R = Term. % retorna o termo 

parsing(sin(Term1), Result) :-
    mono_operation(Term1, R), % verifica se tem um sin(_)
    atom_concat('operacao(sin,', R, Result). % Concatena a operação e R para result

parsing(Term1 + Term2, Result) :-
    double_operation(Term1, Term2, R), % Verifica se tem um x + y
    atom_concat('operacao(soma,', R, Result). % Concatena a operaçõ e R para result
 
% Análogo a soma
parsing(Term1 - Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(subtracao,', R, Result).
% Análogo a soma
parsing(Term1 / Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(divisao,', R, Result).
% Análogo a soma
parsing(Term1 * Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(multiplicacao,', R, Result).
% Análogo a soma
parsing(Term1 ** Term2, Result) :-
    double_operation(Term1, Term2, R),
    atom_concat('operacao(elevado,', R, Result).



% Identico ao de cima, contudo sem apresentar nada na tela



silent_mono_operation(Term1, Result) :-
    silent_parsing(Term1, Remainder),
    atom_concat(Remainder, ')', Result).

silent_double_operation(Term1, Term2, Result) :-
    silent_parsing(Term1, Resto1),
    silent_parsing(Term2, Resto2),
    atom_concat(Resto1, ',', R1),
    atom_concat(R1, Resto2, R2),
    atom_concat(R2, ')', Result).

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
     
% operacao(soma,1,2) =>  operacao(soma,1,2,R)
prepare_tree(Tree, Resultado) :-
    !,
    atom_chars(Tree, Chars),
    append(Inicio, [_], Chars), % Separando a lista de caracteres em duas partes: Início (todos os caracteres exceto o último) e Último
    append(Inicio, [',', 'R', ')', '.'], NovosChars), % Adicionando 'ab' no final de Início
    atom_chars(Resultado, NovosChars). % Convertendo a lista de caracteres de volta para um átomo
    
