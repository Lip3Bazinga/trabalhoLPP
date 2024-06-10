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

(defun TG (A print_enabled)
    (cond 
        (   ; se A falhou e retornou nil, entao
            ; essa operacao retorna nil em cascata
            (null A)
                nil
        )
        (   ; A e numero
            (numberp A) 
                (let* ((remainder (mod A pi)))
                    (cond 
                        (   ; tg(pi/2 + k*pi) -> 
                            ;   sin(pi/2 + k*pi)/cos(pi/2 + k*pi) 
                            ;   -> +1/0 ou -1/0
                            (= remainder (/ pi 2))
                                (if print_enabled
                                    (print (format nil "~c[31mTG(~a) == pi/2 + K*pi~c[0m" #\Escape A #\Escape))
                                )
                                nil
                        )
                        (
                            T
                                (tan A)
                        )
                    )
                )
        )
        (
            T   
                (if print_enabled
                    (print (format nil "~c[32mtg(~a) != pi/2 + K*pi~c[0m" #\Escape A #\Escape))
                )
                (format nil "tg(~a)" A)
        )
    )
)
