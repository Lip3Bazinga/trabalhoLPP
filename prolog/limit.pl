% Alexandre Santato - 14555162
% Filipe Pio Magalhães - 14756232
% Henrique Bloemer Kulkamp - 1465404

:- consult('function.pl').

% f(x) é continua
limit(Function, A, Limit) :-
    silent_apply(Function, A, Limit),
    write('\e[32mcondicoes para a funcao ser continua:\e[0m'),nl,
    nl,
    apply(Function, A, Limit),
    nl,!. % corte verde

% f(x) não é continua
limit(Function, A, Limit) :-
    (   atom(A) 
        -> (    
            term_to_atom(Compound_A, A),
            Exp_A1 is Compound_A+0.0000001,
            Exp_A2 is Compound_A-0.0000001
        )
        ;   Exp_A1 is A+0.0000001,
            Exp_A2 is A-0.0000001),    

    Tolerancia = (0.0001),  
    format(atom(Raw_A1), '~10f', [Exp_A1]),
    format(atom(Raw_A2), '~10f', [Exp_A2]),


    atom_concat('(', Raw_A1, Temp1),
    atom_concat(Temp1, ')', A1),
    atom_concat('(', Raw_A2, Temp2),
    atom_concat(Temp2, ')', A2),
    
    silent_apply(Function, A1, R1),!,
    silent_apply(Function, A2, R2),
    
    !, % corte vermelho: se ter uma variavel livre em R1 ou R2, o limite depende da variavel
    check_term(R1),
    check_term(R2),

    AbsDiff is abs(R1-R2),

    (   AbsDiff < Tolerancia ->
        round_third_place((R1 + R2) / 2, Limit);
        Limit = 'O Limite nao existe'
    ),
    nl,
    !. % corte verde


check_term(Termo) :-
    try_atom_chars(Termo, ListaCaracteres),  % Tenta converter o termo em uma lista de caracteres
    check_chars(ListaCaracteres).            % Verifica se cada caractere é um átomo

try_atom_chars(Termo, ListaCaracteres) :-
    catch(atom_chars(Termo, ListaCaracteres), _, fail).

% Predicado auxiliar para verificar se cada caractere é um átomo
check_chars([]).                        % Caso base: lista vazia, retorna verdadeiro
check_chars([Char|Resto]) :-
    atom(Char),                         % Verifica se o caractere é um átomo
    check_chars(Resto).                 % Verifica o restante da lista recursivamente
    

round_third_place(Number, Rounded) :-
    Rounded is round(Number * 1000) / 1000.
    