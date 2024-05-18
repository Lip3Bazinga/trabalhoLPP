% importação de arquivos necessários
:- consult('parser.pl'). 
:- consult('evaluate_ast.pl').

% Chamada de função: 
apply(Expression, Value, Result) :-
    atom(Value), % Verifica se o valor é um átomo
    invoke(x, Value, Expression, New_Expression), % Vai substituir as ocorrências de x pela variável
    parsing(New_Expression, Expr_without_var), % Passa a expressão para uma estrutura de árvore de operações
    prepare_tree(Expr_without_var, Expr_with_var), % operacao(soma,1,2) => operacao(soma,1,2,R)
    evaluate_ast(Expr_with_var, Result). % calcula o valor da expressão 

% Chamda de função: a mesma coisa que a primeira, mas caso value não seja um átomo, transforma-o em átomo
apply(Expression, Value, Result) :-
    \+ atom(Value), % Não é um átomo
    term_to_atom(Value, B), % transforma em átomo
    atom_concat('(', B, Temp), % Adiciona parênteses para evitar erro quando value for negativo, pois identificaria como operação
    atom_concat(Temp, ')', Variable), % Fecha parênteses
    invoke(x, Variable, Expression, New_Expression),
    parsing(New_Expression, Expr_without_var),
    prepare_tree(Expr_without_var, Expr_with_var),    
    evaluate_ast(Expr_with_var, Result).

% Chmada de função na qual nada é escrito caso value seja um átomo 
silent_apply(Expression, Value, Result) :-
    atom(Value),
    invoke(x, Value, Expression, New_Expression),
    silent_parsing(New_Expression, Expr_without_var),
    prepare_tree(Expr_without_var, Expr_with_var),
    evaluate_ast(Expr_with_var, Result).

% Chmada de função na qual nada é escrito caso value não seja um átomo
silent_apply(Expression, Value, Result) :-
    \+ atom(Value),
    term_to_atom(Value, B),
    atom_concat('(', B, Temp),
    atom_concat(Temp, ')', Variable),
    invoke(x, Variable, Expression, New_Expression),
    silent_parsing(New_Expression, Expr_without_var),
    prepare_tree(Expr_without_var, Expr_with_var),
    evaluate_ast(Expr_with_var, Result).

replace_all(_, _, [], []). % Função que faz o invoke
replace_all(X, Y, [X|T], [Y|T2]) :- replace_all(X, Y, T, T2).
replace_all(X, Y, [H|T], [H|T2]) :- H \= X, replace_all(X, Y, T, T2).

invoke(X, A, Expr, Result) :-
    atom(Expr), % Verifica se a expressão é um átomo
    atom_chars(Expr, List_of_chars), % transforma a expressão em uma lista de char
    replace_all(X, A, List_of_chars, New_list), % Troca todos os elementos x da lista de char por a e retorna uma nova lista
    atomic_list_concat(New_list, Result). % Transforma a lista em uma expressão

invoke(X, A, Expr, Result) :-
    \+ atom(Expr), % Não é um átomo
    term_to_atom(Expr, Atom), % transforma em um átomo
    invoke(X, A, Atom, AtomResult), % substitui 
    atom_to_term(AtomResult, Result, _). % Transforma para termo 
    
