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

(defun ARCCOS (A print_enabled)
    (cond 
        (   ; se A falhou e retornou nil, entao
            ; essa operacao retorna nil em cascata
            (null A)
                nil
        )
        (   ; A e numero
            (numberp A) 
                (cond 
                    (
                        (and (<= -1 A) (<= A 1))
                            (acos A)                        
                    )
                    (
                        T
                            (if print_enabled
                                (print (format nil "~c[31mFora do dominio de arccos(X)~c[0m" #\Escape #\Escape))
                            )
                            nil
                    )
                )
        )
        (
            T   
                (if print_enabled
                    (print (format nil "~c[32m-1 <= ~a <= 1~c[0m" #\Escape A #\Escape))
                )
                (format nil "arccos(~a)" A)
        )
    )
)
