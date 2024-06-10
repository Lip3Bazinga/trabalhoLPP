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
  
(defun SINE (A print_enabled)
    (declare (ignorable print_enabled))
    (cond 
        (   ; se A falhou e retornou nil, entao
            ; essa operacao retorna nil em cascata
            (null A)
                nil
        )
        (   ; A e numero
            (numberp A) 
                (sin A) 
        )
        (
            T
                (format nil "sin(~a)" A)
        )
    )
)
