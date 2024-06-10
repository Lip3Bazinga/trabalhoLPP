% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- multifile operacao/3.
:- multifile silent_operacao/3.

operacao(sin, A, C) :-
    number(A),
    C is sin(A),
    !.

operacao(sin, A, C) :-
    C = sin(A).

silent_operacao(sin, A, C) :-
    operacao(sin, A, C).
