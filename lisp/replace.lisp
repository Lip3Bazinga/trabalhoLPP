"
Alexandre Santato - 14555162
Filipe Pio Magalhães - 14756232
Henrique Bloemer Kulkamp - 146540
"

(defpackage :infix
  (:use :common-lisp)
  (:export :add)
  (:export :sub)
  (:export :mult)
  (:export :div)
  (:export :elev)
  )

(defun bind-variable (tree_node old new)
"Substitui o old: antigo valor, pelo new: novo valor

        ARVORE EXEMPLO:
            (+)  <- node
           /   \
          /     \
node -> (x)     (*) <- node
               /   \
              /     \  
   node ->  (x)     (b) <- node            

        ARVORE EXEMPLO:
   node ->  (+)
           /   \
          /     \
node -> (x)     (*) <- node
               /   \
              /     \  
    node -> (x)     (b) <- node


exemplo:  [(* 1 2)            'X 'A] -> (* 1 2)
          [(ln x)             'X 'A] -> (ln a)
          [(+ (- a b) c)      'X 'A] -> (+ (- a b) c)
          [(+ (sin x) 1)      'X 'A] -> (+ (sin a) 1)
          [(+ (ln (* 2 x)) 2) 'X 'A] -> (+ (ln (* 2 a)) 2)
"
    ; (print '__)
    ; (print tree_node)
    ; (print '__)
    (cond
        (   ; caso base folha nao e um node
            (not (listp tree_node))
                ; (print tree_node)
                (if (equal (princ-to-string tree_node) (concatenate 'string "'" (princ-to-string old)))
                    (if (symbolp new)
                        (setf tree_node (symbol-name new))
                        (setf tree_node new)
                    )
                )
                tree_node
        )
        ( ; caso baso, folha == 'valor
            (and (listp tree_node) (= (length tree_node) 2) (eq (first tree_node) 'quote))
                (if (equal (princ-to-string tree_node) (concatenate 'string "'" (princ-to-string old)))
                    (if (symbolp new)
                        (setf tree_node (symbol-name new))
                        (setf tree_node new)
                    )
                )
                tree_node
        )
        (   ; caso recursivo operacao unaria (op valor)
            (= (length tree_node) 2)
                (let* (
                    (first_operand (car (cdr tree_node)))
                    )

                    ( setf (car (cdr tree_node)) (bind-variable first_operand  old new))                
                )
                tree_node
        )
        (   ; caso recursivo operacao dupla (op valor1 valor2)
            (= (length tree_node) 3)
                ; (print tree_node)
                (let* (
                    (left (car (cdr tree_node))) 
                    (right (car (cdr (cdr tree_node))))
                    ) 
                
                    ( setf (car (cdr tree_node)) (bind-variable left old new))
                    ( setf (car (cdr (cdr tree_node))) (bind-variable right old new))
                )
                tree_node
        )
    )
)


; (setf a '(^ (sin (+ 'x 2)) 2))
; (setf a '(+ (^ (sin 'x) 2) 'x)  )

; (print (bind-variable a 'x 1))
