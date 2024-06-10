% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- multifile operacao/4.
:- multifile silent_operacao/4.

% numerico
operacao(multiplicacao, A, B, C) :-
    number(A),
    number(B),
    C is A*B,
    !.

% nao numerico
operacao(multiplicacao, A, B, C) :-
    C = A*B.

% silencioso
silent_operacao(multiplicacao, A, B, C) :-
    operacao(multiplicacao, A, B, C).

silent_operacao(multiplicacao, A, B, C) :-
    operacao(multiplicacao, A, B, C).