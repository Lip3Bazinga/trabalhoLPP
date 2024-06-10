% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- multifile operacao/3.
:- multifile silent_operacao/3.

operacao(acos, A, C) :-
    number(A),
    !,
    acos_check(A),
    C is acos(A).

operacao(acos, A, C) :-
    acos_check(A),
    C = acos(A).

silent_operacao(acos, A, C) :-
    number(A),
    !,
    silent_acos_check(A),
    C is acos(A).


silent_operacao(acos, A, C) :-
    C = acos(A).

acos_check(A) :-
    number(A),
    !,
    A >= -1,
    A =< 1.

acos_check(A) :-
    write('\e[34m'),
    write('-1 <= '),
    write(A),
    write(' <= 1'),
    write('\e[0m'),nl.

silent_acos_check(A) :-
    number(A),
    !,
    A >= -1,
    A =< 1.