"
Alexandre Santato - 14555162
Filipe Pio Magalhães - 14756232
Henrique Bloemer Kulkamp - 146540
"

(load "./operacoes/_main.lisp")
(load "evaluate.lisp")
(load "replace.lisp")
(load "infix.lisp")


(defun apply-function (Func value &optional (print_enabled NIL))
    "Calcula o F(valor) de forma literal, se possivel
    Exemplo:
        input:   sin(x), x=0
            (apply-function '#I(sine('x)) 0)    
        output:
            0.0
    "
    (let* (formatted-F)
        (bind-variable Func 'x value)

        (setf formatted-F (add-node-parameters Func NIL print_enabled))
        (eval formatted-F)
    )
)


; (setf a '#I('a*'b/'c*(1^2)))
; (print (apply-function a 0 NIL))