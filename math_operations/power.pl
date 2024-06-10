:- multifile operacao/4.
:- multifile silent_operacao/4.

% numerico
operacao(elevado, A, B, C) :-
    number(A),
    number(B),
    !,
    elevado_check(A, B),
    C is A**B.

% nao numerico
operacao(elevado, A, B, C) :-
    elevado_check(A, B),
    C = A**B.

silent_operacao(elevado, A, B, C) :-
    number(A),
    number(B),
    !,
    silent_elevado_check(A, B),
    C is A**B.

silent_operacao(elevado, A, B, C) :-
    C = A**B.


elevado_check(A, B) :-
    number(A),
    number(B),
    !,
    (   A =\= 0
    ;   B > 0),

    (   A >= 0
    ;   integer(B)).

elevado_check(A, B) :-
    number(A),
    !,
    (   A =:= 0 ->
        write('\e[31m'),
        write(B),
        write(' > 0'),
        write('\e[0m'),nl
    ;   true
    ),

    (   A < 0 ->   
        write('\e[34m'),
        write(B),
        write(' e Inteiro'),
        write('\e[0m'),nl
    ;   true
    ).

elevado_check(A, B) :-
    number(B),
    !,
    (   B < 0 ->
        write('\e[31m'),
        write(A),
        write(' != 0'),
        write('\e[0m'),nl
    ;   true),
    (   float(B) ->
        write('\e[34m'),
        write(A),
        write(' >= 0'),
        write('\e[0m'),nl
        ;   true).

elevado_check(A, B) :-
    write('\e[31m'),
    write(A),
    write(' != 0 ou '),
    write(B),
    write(' > 0'),
    write('\e[34m'),nl,    
    write(A),
    write(' >= 0 ou '),
    write(B),
    write(' e Inteiro'),
    write('\e[0m'),nl.    


silent_elevado_check(A, B) :-
    number(A),
    number(B),
    !,
    (   A =\= 0
    ;   B > 0),

    (   A >= 0
    ;   integer(B)).