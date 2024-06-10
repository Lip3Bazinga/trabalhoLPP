:- consult('function.pl'). % importando o arquivo 'function.pl'


limit(Function, A, Limit) :-
    silent_apply(Function, A, Limit), % Chamada de função, se true corte e aplica na função
    !,
    apply(Function, A, Limit). 

limit(Function, A, Limit) :- % Se não for contínua (limite != chamada)
    Tolerancia = (0.0001), % tolerância dos limites laterais
    Exp_A1 is A+0.0000001, % Direita
    Exp_A2 is A-0.0000001, % Esquerda
    format(atom(Raw_A1), '~10f', [Exp_A1]), % Para direita não ficar em notação científica  
    format(atom(Raw_A2), '~10f', [Exp_A2]), % Para esquerda não ficar em notação científica 
    % Colocar parênteses no argumento do limite
    atom_concat('(', Raw_A1, Temp1), 
    atom_concat(Temp1, ')', A1),
    atom_concat('(', Raw_A2, Temp2),
    atom_concat(Temp2, ')', A2),
        
    silent_apply(Function, A1, R1), %
    silent_apply(Function, A2, R2), % 

    AbsDiff is abs(R1-R2), % Diferença dos limites laterais

    % Verifica se está na tolerância

    (   AbsDiff < Tolerancia ->
        round_third_place((R1 + R2) / 2, Limit) % Tira a média e arredonda para 3 casas decimais
    ;   Limit = 'Limite nao alcancado' 
    ).


round_third_place(Number, Rounded) :- % Função que arredonda para 3 casas decimais
    Rounded is round(Number * 1000) / 1000.
    