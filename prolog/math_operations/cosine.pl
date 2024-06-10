% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

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
