:- consult('parser.pl').
:- consult('evaluate_ast.pl').

apply(Expression, Value_without_parenthesis, Result) :-
    atom(Value_without_parenthesis),
    atom_concat('(', Value_without_parenthesis, Value_with_left_parenthesis),
    atom_concat(Value_with_left_parenthesis, ')', Value),
    invoke(x, Value, Expression, New_Expression),
    parsing(New_Expression, Expr_without_var),
    prepare_tree(Expr_without_var, Expr_with_var),
    !,
    evaluate_ast(Expr_with_var, Result).

apply(Expression, Value, Result) :-
    \+ atom(Value),
    term_to_atom(Value, B),
    atom_concat('(', B, Temp),
    atom_concat(Temp, ')', Variable),
    invoke(x, Variable, Expression, New_Expression),
    parsing(New_Expression, Expr_without_var),
    prepare_tree(Expr_without_var, Expr_with_var),    
    !,
    evaluate_ast(Expr_with_var, Result).

silent_apply(Expression, Value, Result) :-
    atom(Value),
    invoke(x, Value, Expression, New_Expression),
    silent_parsing(New_Expression, Expr_without_var),
    prepare_tree(Expr_without_var, Expr_with_var),
    !,
    evaluate_ast(Expr_with_var, Result).

silent_apply(Expression, Value, Result) :-
    \+ atom(Value),
    term_to_atom(Value, B),
    atom_concat('(', B, Temp),
    atom_concat(Temp, ')', Variable),
    invoke(x, Variable, Expression, New_Expression),
    silent_parsing(New_Expression, Expr_without_var),
    prepare_tree(Expr_without_var, Expr_with_var),
    !,
    evaluate_ast(Expr_with_var, Result).

replace_all(_, _, [], []).
replace_all(X, Y, [X|T], [Y|T2]) :- replace_all(X, Y, T, T2).
replace_all(X, Y, [H|T], [H|T2]) :- H \= X, replace_all(X, Y, T, T2).

invoke(X, A, Expr, Result) :-
    atom(Expr),
    atom_chars(Expr, List_of_chars),
    replace_all(X, A, List_of_chars, New_list),
    atomic_list_concat(New_list, Result).

invoke(X, A, Expr, Result) :-
    \+ atom(Expr), 
    term_to_atom(Expr, Atom), 
    invoke(X, A, Atom, AtomResult), 
    atom_to_term(AtomResult, Result, _).
    
