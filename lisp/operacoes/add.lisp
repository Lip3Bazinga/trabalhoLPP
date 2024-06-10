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

(defun INFIX:ADD (A B Op_anterior print_enabled)
    (declare (ignorable print_enabled))
    (let* (resp)
        (cond 
            (   ; se A ou B falhou e retornou nil, entao
                ; essa operacao retorna nil em cascata
                (or (null A) (null B))
                    (setf resp nil)
            )
            (   ; A e B sao numeros
                (and (numberp A) (numberp B)) 
                    (setf resp (+ A B))
            )
            (
                T
                    (setf resp (format nil "~a+~a" A B))
            )
        )

        (if (and (stringp resp) (require-parentheses 'INFIX:ADD Op_anterior))
          (setf resp (format nil "(~a)" resp))
        )

        resp
    )

)