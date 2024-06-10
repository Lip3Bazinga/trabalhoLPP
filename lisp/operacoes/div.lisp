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

(defun INFIX:DIV (A B Op_anterior print_enabled)
    (cond 
        (   ; se A ou B falhou e retornou nil, entao
            ; essa operacao retorna nil em cascata
            (or (null A) (null B))
                nil
        )
        (   
            ; B e numero e igual a zero
            (and (numberp B) (eq B 0))
                (if print_enabled
                    (print (format nil "~c[31m~a~c[0m" #\Escape "NAO PODE DIVIDIR POR 0" #\Escape))                
                )
                nil
        )
        (   ; A e B sao numeros
            (and (numberp A) (numberp B)) 
                (float (/ A B))
        )
        (   ; Nao pode realizar a operacao '/' de forma numerica, 
            ; e Op_anterior tem maior precedencia sobre '/'
            (require-parentheses 'INFIX:DIV Op_anterior)
                (if print_enabled
                    (print (format nil "~c[34m~a != 0~c[0m" #\Escape B #\Escape))
                )
                (format nil "(~a/~a)" A B)
        )
        (
            T   
                (if print_enabled   
                    (print (format nil "~c[34m~a != 0~c[0m" #\Escape B #\Escape))
                )
                (format nil "~a/~a" A B)
        )
    )
)
