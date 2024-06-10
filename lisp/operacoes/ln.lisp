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

(defun LN (A print_enabled)
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
                        (> A 0)
                            (log A)
                    )
                    (
                        T
                            (if print_enabled
                                (print (format nil "~c[31mFora do dominio de ln(X)~c[0m" #\Escape #\Escape))
                            )
                            nil
                    )
                )
        )
        (
            T   
                (if print_enabled
                    (print (format nil "~c[32m~a > 01~c[0m" #\Escape A #\Escape))
                )
                (format nil "ln(~a)" A)
        )
    )
)
