:- multifile operacao/4.
:- multifile silent_operacao/4.

operacao(divisao, A, B, C) :-
    number(A),
    number(B),
    check(divisao, A, B),
    C is A/B.

operacao(divisao, A, B, C) :-
    check(divisao, A, B),
    C = A/B.


silent_operacao(divisao, A, B, C) :-
    number(A),
    number(B),
    silent_check(divisao, A, B),
    C is A/B.

silent_operacao(divisao, A, B, C) :-
    silent_check(divisao, A, B),
    C = A/B.

% condicoes para dividir.
check(divisao, _, B) :-
    number(B),
    !,
    B \= 0,
    B \= 0.0. 

check(divisao, _, B) :-
    noop(B),
    write(B),
    write(' != 0'),nl.
    
silent_check(divisao, _, B) :-
    number(B),
    !,
    B \= 0,
    B \= 0.0.

silent_check(divisao, _, B) :-
    noop(B).