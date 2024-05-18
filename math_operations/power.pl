:- multifile operacao/4.
:- multifile silent_operacao/4.

% numerico
operacao(elevado, A, B, C) :-
    number(A),
    number(B),
    check(elevado, A, B),
    C is A**B,
    !.

% nao numerico
operacao(elevado, A, B, C) :-
    check(elevado, A, B),
    C = A**B.

silent_operacao(elevado, A, B, C) :-
    number(A),
    number(B),
    silent_check(elevado, A, B),
    C is A**B,
    !.

silent_operacao(elevado, A, B, C) :-
    C = A**B.


check(elevado, A, B) :-
    number(A),
    number(B),
    !,
    (   A =\= 0
    ;   B >= 0).

check(elevado, A, B) :-
    number(A),
    (   A =:= 0 ->
        write(B),
        write(' >= 0'),nl
    ;   true).

check(elevado, A, B) :-
    number(B),
    (   B < 0 ->
        write(A),
        write(' != 0'),nl
    ;   true).

check(elevado, A, B) :-
    noop(A),
    write(A),
    write(' != 0 ou '),
    write(B),
    write(' >= 0'),nl.    


silent_check(elevado, A, B) :-
    number(A),
    number(B),
    !,
    (   A =\= 0
    ;   B >= 0).