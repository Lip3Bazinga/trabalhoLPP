% 
is_operation(Compound) :-
    term_to_atom(Compound, Atom), 
    sub_atom(Atom, _, _, _, operacao).

noop(Expr) :-
    is_operation(Expr),
    !,
    fail.

noop(_).