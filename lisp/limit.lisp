"
Alexandre Santato - 14555162
Filipe Pio Magalhães - 14756232
Henrique Bloemer Kulkamp - 146540
"

(load "function.lisp")

(defun limit (F value)
    ; epsilon -> calcular limites laterais
    ; delta -> margem de erro para os limites
    ; modified_func -> e usada para nao alterar a arvore original

    (let* ((epsilon 0.1) (delta 0.2) limit left_limit right_limit (modified_func (copy-tree F))) 
        
        (setf limit (apply-function modified_func value NIL))

        (setf modified_func (copy-tree F))
        ; F e continua
        (when limit
            (apply-function modified_func value T)
            (return-from limit limit)        
        )

        ; F nao e continua

        ; se nao deu certo para uma letra, esquece
        (when (not (numberp value))
            (return-from limit NIL)
        )

        ; o x-> nro
        ; calculando os limites individuais
        ; comecando pela esquerda
        (let* ((left_value (- value epsilon)))
            (setf left_limit (apply-function modified_func left_value NIL))
            (setf modified_func (copy-tree F))  
            (print left_value)
        )

        ; direita
        (let* ((right_value (+ value epsilon)))
            (setf right_limit (apply-function modified_func right_value NIL))
            (setf modified_func (copy-tree F))  
            (print right_value)
        )
        

        (cond 
        ;; LL -> Left Limit
        ;; RL -> Right Limit
            (   ; LL e RL sao algebricos, mas iguais
                (and (stringp left_limit) (stringp right_limit))
                    (when (string= left_limit right_limit)
                        left_limit
                    )
            )
            (   ; LL e RL sao nros, e proximos o bastante
                (and (numberp left_limit) (numberp right_limit))
                    (when   (< (abs (- left_limit right_limit))  delta)
                        ; tirando a media dos dois limites
                        (setf limit (/ (+ left_limit right_limit) 2))
                    )
            )
            (   ; caso contrario retorne nil
                T
                    NIL
            )
        )

        
    )
)