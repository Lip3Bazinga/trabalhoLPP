% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- multifile operacao/4.
:- multifile silent_operacao/4.

% numerico
operacao(subtracao, A, B, C) :-
    number(A),
    number(B),
    C is A-B,
    !.

% nao numerico
operacao(subtracao, A, B, C) :-
    C = A-B.

silent_operacao(subtracao, A, B, C) :-
    operacao(subtracao, A, B, C).

silent_operacao(subtracao, A, B, C) :-
    operacao(subtracao, A, B, C).