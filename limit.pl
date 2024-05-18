:- consult('function.pl').


limit(Function, A, Limit) :-
    silent_apply(Function, A, Limit),
    !,
    apply(Function, A, Limit).

limit(Function, A, Limit) :-
    Tolerancia = (0.0001), 
    Exp_A1 is A+0.0000001,
    Exp_A2 is A-0.0000001,  
    format(atom(Raw_A1), '~10f', [Exp_A1]),
    format(atom(Raw_A2), '~10f', [Exp_A2]),

    atom_concat('(', Raw_A1, Temp1),
    atom_concat(Temp1, ')', A1),
    atom_concat('(', Raw_A2, Temp2),
    atom_concat(Temp2, ')', A2),
        
    silent_apply(Function, A1, R1),
    silent_apply(Function, A2, R2),

    AbsDiff is abs(R1-R2),

    (   AbsDiff < Tolerancia ->
        round_third_place((R1 + R2) / 2, Limit)
    ;   Limit = 'Limite nao alcancado'
    ).


round_third_place(Number, Rounded) :-
    Rounded is round(Number * 1000) / 1000.
    