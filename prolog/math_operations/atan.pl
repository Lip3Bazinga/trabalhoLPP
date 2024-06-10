% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- multifile operacao/3.
:- multifile silent_operacao/3.

operacao(atan, A, C) :-
    number(A),
    !,
    C is atan(A).

operacao(atan, A, C) :-
    C = atan(A).

silent_operacao(atan, A, C) :-
    operacao(atan, A, C).

