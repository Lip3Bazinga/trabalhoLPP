% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

is_operation(Compound) :-
    term_to_atom(Compound, Atom), 
    sub_atom(Atom, _, _, _, operacao).

noop(Expr) :-
    is_operation(Expr),
    !,
    fail.

noop(_).