% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- multifile operacao/4.
:- multifile silent_operacao/4.

operacao(log, A, B, C) :-
    number(A),
    number(B),
    !,
    log_check(A, B),
    C is log(B)/log(A).

operacao(log, A, B, C) :-
    log_check(A, B),
    C = log(A, B).


silent_operacao(log, A, B, C) :-
        number(A),
        number(B),
        !,
        silent_log_check(A, B),
        C is log(B)/log(A).
    
silent_operacao(log, A, B, C) :-
        silent_log_check(A, B),
        C = log(A, B).

% A e B sao numeros
log_check(A, B) :-
    number(A),
    number(B),
    !,
    A > 0,
    A =\= 1,
    B > 0.

% A e numero B nao
log_check(A, B) :-
    number(A),
    !,
    A > 0,
    A =\= 0,
    write('\e[35m'),
    write(B),
    write(' > 0'),
    write('\e[0m'),nl.

% B e numero A nao
log_check(A, B) :-
    number(B),
    !,
    B > 0,
    write('\e[35m'),
    write(A),
    write(' > 0'),nl,
    write(A),
    write(' != 1'),
    write('\e[0m'),nl.

% nem A nem B sao numeros
log_check(A, B) :-
    write('\e[35m'),
    write(B),
    write(' > 0'),nl,
    write(A),
    write(' > 0'),nl,
    write(A),
    write(' != 1'),
    write('\e[0m'),nl.

silent_log_check(A, B) :-
    number(A),
    number(B),
    !,
    A > 0,
    A =\= 0,
    B > 0.

silent_log_check(A, _) :-
    number(A),
    !,
    A > 0,
    A =\= 0.

silent_log_check(_, B) :-
    number(B),
    !,
    B > 0.

silent_log_check(_, _).