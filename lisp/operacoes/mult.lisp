"
Alexandre Santato - 14555162
Filipe Pio Magalhães - 14756232
Henrique Bloemer Kulkamp - 146540
"

(load "precedence.lisp")

(defpackage :infix
  (:use :common-lisp)
  (:export :add)
  (:export :sub)
  (:export :mult)
  (:export :div)
  (:export :elev)
  )
  
(defun INFIX:MULT (A B Op_anterior print_enabled)
    (declare (ignorable print_enabled))
    (cond 
        (   ; se A ou B falhou e retornou nil, entao
            ; essa operacao retorna nil em cascata
            (or (null A) (null B))
                nil
        )
        (   ; A e B sao numeros
            (and (numberp A) (numberp B)) 
                (* A B) 
        )
        (   ; Nao pode realizar a operacao '*' de forma numerica, 
            ; e Op_anterior tem maior precedencia sobre '*'
            (require-parentheses 'INFIX:MULT Op_anterior)
                (format nil "(~a*~a)" A B)
        )
        (
            T
                (format nil "~a*~a" A B)
        )
    )
)