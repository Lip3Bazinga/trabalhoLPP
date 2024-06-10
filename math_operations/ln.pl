:- multifile operacao/4.
:- multifile silent_operacao/4.


operacao(ln, A, B) :-
    number(A),
    !,
    ln_check(A),
    B is log(A).

operacao(ln, A, B) :-
    ln_check(A),
    B = ln(A).    

silent_operacao(ln, A, B) :-
    number(A),
    !,
    silent_ln_check(A),
    B is log(A).

silent_operacao(ln, A, B) :-
    silent_ln_check(A),
    B = ln(A).


ln_check(A) :-
    number(A),
    !,
    A > 0.

ln_check(A) :-
    write('\e[36m'),
    write(A),
    write(' > 0'),
    write('\e[0m'),nl.

silent_ln_check(A) :-
    number(A),
    !,
    A > 0.

silent_log_check(_).