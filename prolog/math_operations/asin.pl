% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- multifile operacao/3.
:- multifile silent_operacao/3.

operacao(asin, A, C) :-
    number(A),
    !,
    asin_check(A),
    C is asin(A).

operacao(asin, A, C) :-
    asin_check(A),
    C = asin(A).

silent_operacao(asin, A, C) :-
    number(A),
    !,
    silent_asin_check(A),
    C is asin(A).


silent_operacao(asin, A, C) :-
    C = asin(A).
    

asin_check(A) :-
    number(A),
    !,
    A >= -1,
    A =< 1.

asin_check(A) :-
    write('\e[34m'),
    write('-1 <= '),
    write(A),
    write(' <= 1'),
    write('\e[0m'),nl.

silent_asin_check(A) :-
    number(A),
    !,
    A >= -1,
    A =< 1.

