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

(defun add-node-parameters (tree_node &optional (operator nil) (print_enabled nil))
"Adiciona dois operadores recursivamente no nodes da arvore de operacoes:
        ARVORE EXEMPLO:
     node ->   (+ _  _)
                /     \
               /       \
   node -> (- _ _)   (* _ _) <- node

        ARVORE EXEMPLO:
     node ->   (+ _  _ NIL T)
                 /         \
                /           \
   node -> (- _ _ + T)   (* _ _ + T) <- node


 1. 'operator' operador do no pai, 
  e implementado apenas nas operacoes +, -, *, /, ^
  e na raiz e nil
 
 2. 'print_enabled' define tera outputs na tela durante o processamento da 
  arvore de operacoes 

exemplo:  [(* 1 2)            NIL T] -> (* 1 2 NIL T)
          [(ln x)                 T] -> (ln x T)
          [(+ (- a b) c)      NIL T] -> (+ (- a b + T) c NIL T)
          [(+ (sin x) 1)      NIL T] -> (+ (sin x T) 1 NIL T)
          [(+ (ln (* 2 x)) 2) NIL T] -> (+ (ln (* 2 x ln T) T) 2 NIL T)
"
  
  (cond 
    ( ; se for um valor, nao um node
      (not (listp tree_node))
        tree_node
    )
    ( ; se for um valor com quote, 'a, 'b, nao um node
      (and (listp tree_node) (= (length tree_node) 2) (eq (first tree_node) 'quote))
        tree_node
    )
    (
      (= (length tree_node) 2)
        (let* 
          (
            (op (car tree_node)) 
            (first_operand (car (cdr tree_node)))
          )      
          ; ir pro operando 1 passando o novo operador
          ; e modificar o valor
          ( setf (car (cdr tree_node)) (add-node-parameters first_operand op print_enabled))

          ; Adiciona se vai printar o conteudo
          (setf tree_node (append tree_node (list print_enabled)))

          tree_node
        )
    )
    (
      (= (length tree_node) 3)
        (let* 
          (
            (op (car tree_node)) 
            (first_operand (car (cdr tree_node)))
            (second_operand (car (cdr (cdr tree_node))))
          )      
          ; ir pro operando 1 passando o novo operador
          ; e modificar o valor
          ( setf (car (cdr tree_node)) (add-node-parameters first_operand op print_enabled))
          ; ir pro operando 2 passando o novo operador
          ; e modificar o valor
          ( setf (car (cdr (cdr tree_node))) (add-node-parameters second_operand op print_enabled))

          ; adicionar o antigo operador no fim da arvore
          (setf tree_node (append tree_node (list (princ-to-string operator))))

          ; Adiciona se vai printar o conteudo
          (setf tree_node (append tree_node (list print_enabled)))

          tree_node
        )
    )
  )
)