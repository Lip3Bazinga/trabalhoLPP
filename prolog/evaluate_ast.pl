% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- consult('is_op.pl').

evaluate_ast(Atomic_tree, Resp) :-
    read_term_from_atom(Atomic_tree, Expression_tree, []),
    call(Expression_tree), % Chama a função
    (
        arg(4, Expression_tree, Resp); 
            % caso a primeira operacao seja uma operacao dupla 
            % Ex: 4 + 5.
        arg(3, Expression_tree, Resp)
            % caso a primeira operacao seja uma operacao unitaria
            % Ex: sen(0.5).
    ).
 
% caso seja recursivo em A com operacao dupla
operacao(O, A, B, C) :-
    A = operacao(Op, A1, B1),!,
    operacao(Op, A1, B1, X),
    operacao(O, X, B, C).

% caso seja recursivo em A com operacao unitaria
operacao(O, A, B, C) :-
    A = operacao(Op, A1),!,
    operacao(Op, A1, X),
    operacao(O, X, B, C).

% caso seja recursivo em B com operacao dupla
operacao(O, A, B, C) :-
    B = operacao(Op, A1, B1),!,
    operacao(Op, A1, B1, X),
    operacao(O, A, X, C).

% caso seja recursivo em B com operacao unitaria
operacao(O, A, B, C) :-
    B = operacao(Op, A1),!,
    operacao(Op, A1, X),
    operacao(O, A, X, C).

% caso seja recursiva com operacao dupla
operacao(O, A, C) :-
    A = operacao(Op, A1, B1),!,
    operacao(Op, A1, B1, X),
    operacao(O, X, C).

% caso seja recursiva com operacao unitaria
operacao(O, A, C) :-
    A = operacao(Op, A1),!,
    operacao(Op, A1, X),
    operacao(O, X, C).

% 



% caso seja recursivo em A com operacao dupla
silent_operacao(O, A, B, C) :-
    A = silent_operacao(Op, A1, B1),!,
    silent_operacao(Op, A1, B1, X),
    silent_operacao(O, X, B, C).

% caso seja recursivo em A com silent_operacao unitaria
silent_operacao(O, A, B, C) :-
    A = silent_operacao(Op, A1),!,
    silent_operacao(Op, A1, X),
    silent_operacao(O, X, B, C).

% caso seja recursivo em B com silent_operacao dupla
silent_operacao(O, A, B, C) :-
    B = silent_operacao(Op, A1, B1),!,
    silent_operacao(Op, A1, B1, X),
    silent_operacao(O, A, X, C).

% caso seja recursivo em B com silent_operacao unitaria
silent_operacao(O, A, B, C) :-
    B = silent_operacao(Op, A1),!,
    silent_operacao(Op, A1, X),
    silent_operacao(O, A, X, C).

% caso seja recursiva com silent_operacao dupla
silent_operacao(O, A, C) :-
    A = silent_operacao(Op, A1, B1),!,
    silent_operacao(Op, A1, B1, X),
    silent_operacao(O, X, C).

% caso seja recursiva com silent_operacao unitaria
silent_operacao(O, A, C) :-
    A = silent_operacao(Op, A1),!,
    silent_operacao(Op, A1, X),
    silent_operacao(O, X, C).

% 

:- consult('math_operations/plus.pl').
:- consult('math_operations/minus.pl').
:- consult('math_operations/times.pl').
:- consult('math_operations/divided.pl').
:- consult('math_operations/power.pl').

:- consult('math_operations/sine.pl').
:- consult('math_operations/cosine.pl').
:- consult('math_operations/tangent.pl').
:- consult('math_operations/logarithm.pl').
:- consult('math_operations/ln.pl').

:- consult('math_operations/asin.pl').
:- consult('math_operations/acos.pl').
:- consult('math_operations/atan.pl').