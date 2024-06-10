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

(defun LG (A B Op_anterior print_enabled)
    (declare (ignorable Op_anterior))
    (cond 
        (   ; se A ou B falhou e retornou nil, entao
            ; essa operacao retorna nil em cascata
            (or (null A) (null B))
                nil
        )
        (   ; A e B sao numeros
            (and (numberp A) (numberp B))
            (cond
                (   ; A > 0 A != 1 
                    (or (<= A 0) (= A 1))
                        (if print_enabled
                        (print (format nil "~c[31mBASE INVALIDA: ~a~c[0m" #\Escape A #\Escape))
                        )
                        nil
                )
                (   ; B > 0
                    (<= B 0)
                        (if print_enabled
                            (print (format nil "~c[31mLOGARITMANDO INVALIDO: ~a~c[0m" #\Escape B #\Escape))
                        )
                        nil
                )
                (
                    T
                        (/ (log B) (log A))
                )
            )
        )
        (   ; A e numero e B nao
            (numberp A)
            (cond
                (   ; A > 0 A != 1 
                    (or (<= A 0) (= A 1))
                        (if print_enabled
                        (print (format nil "~c[31mBASE INVALIDA: ~a~c[0m" #\Escape A #\Escape))
                        )
                        nil
                )
                (
                    T   
                        (if print_enabled
                            (print (format nil "~c[33m~a > 0~c[0m" #\Escape B #\Escape))
                        )
                        (format nil "log(~a, ~a)" A B)

                )
            )
        )
        (   ; B e numero e A nao
            (numberp B)
            (cond
                (   ; B < 0
                    (<= B 0)
                        (if print_enabled
                            (print (format nil "~c[31mLOGARITMANDO INVALIDO: ~a~c[0m" #\Escape B #\Escape))
                        )
                        nil
                )
                (
                    T
                        (when print_enabled
                            (print (format nil "~c[33m~a > 0~c[0m" #\Escape A #\Escape))
                            (print (format nil "~c[33m~a != 1~c[0m" #\Escape A #\Escape))
                        )
                        (format nil "log(~a, ~a)" A B)
                )
            )
        )
        (   ; nem A nem B sao numeros
            T
                (when print_enabled
                    (print (format nil "~c[33m~a > 0~c[0m" #\Escape B #\Escape))
                    (print (format nil "~c[33m~a > 0~c[0m" #\Escape A #\Escape))
                    (print (format nil "~c[33m~a != 1~c[0m" #\Escape A #\Escape))
                )
                (format nil "log(~a, ~a)" A B)
        )
    )
)
