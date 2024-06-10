:- multifile operacao/4.
:- multifile silent_operacao/4.

% numerico
operacao(elevado, A, B, C) :-
    number(A),
    number(B),
    elevado_check(A, B),
    C is A**B,
    !.

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
    ;   B >= 0).

elevado_check(A, B) :-
    number(A),
    !,
    (   A =:= 0 ->
        write(B),
        write(' >= 0'),nl
    ;   true).

elevado_check(A, B) :-
    number(B),
    !,
    (   B < 0 ->
        write(A),
        write(' != 0'),nl
    ;   true).

elevado_check(A, B) :-
    write(A),
    write(' != 0 ou '),
    write(B),
    write(' >= 0'),nl.    


silent_elevado_check(A, B) :-
    number(A),
    number(B),
    !,
    (   A =\= 0
    ;   B >= 0).