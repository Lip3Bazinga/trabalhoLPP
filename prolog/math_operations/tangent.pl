% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 14654041

:- multifile operacao/4.
:- multifile silent_operacao/4.

float_mod(X, Y, Result) :-
    Result is X - Y * floor(X / Y).
% 

operacao(tan, A, B) :-
    number(A),
    !,
    tangent_check(A),
    B is tan(A).

operacao(tan, A, B) :-
    tangent_check(A),
    B = tan(A).


silent_operacao(tan, A, B) :-
    number(A),
    !,
    tangent_silent_check(A),
    B is tan(A).

silent_operacao(tan, A, B) :-
    tangent_silent_check(A),
    B = tan(A).


tangent_check(A) :-
    number(A),
    !,
    % R is A mod pi,
    float_mod(A, pi, R),
    R \= pi/2. 

tangent_check(A) :-
    write('\e[36m'),
    write(A),
    write(' != pi/2 + K*pi'),
    write('\e[0m'),nl.
    
tangent_silent_check(A) :-
    number(A),
    !,
    % R is A mod pi,
    float_mod(A, pi, R),
    R \= pi/2. 

tangent_silent_check(_).