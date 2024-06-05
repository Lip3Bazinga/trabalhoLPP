:- multifile operacao/3.
:- multifile silent_operacao/3.

operacao(cos, A, C) :-
    number(A),
    !,
    C is cos(A).

operacao(cos, A, C) :-
    C = cos(A).

silent_operacao(cos, A, C) :-
    operacao(cos, A, C).
