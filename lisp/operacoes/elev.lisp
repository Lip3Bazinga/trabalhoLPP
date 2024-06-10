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

(defun INFIX:ELEV (A B Op_anterior print_enabled)
    (let* (resp)
        (cond 
            (   ; se A ou B falhou e retornou nil, entao
                ; essa operacao retorna nil em cascata
                (or (null A) (null B))
                    (setf resp nil)
            )

            (   ; A e B sao numeros
                (and (numberp A) (numberp B))
                  (cond
                    ( ; 0^0
                      (and (eq A 0) (eq B 0))
                        (if print_enabled
                          (print (format nil "~c[31m~a~c[0m" #\Escape "0 ELEVADO A 0" #\Escape))
                        )
                        (setf resp nil)      
                    )
                    ( ; 0^-1 -> 1/0^1 -> 1/0
                      (and (eq A 0) (< B 0))
                        (if print_enabled
                          (print (format nil "~c[31m~a~c[0m" #\Escape "1/0" #\Escape))
                        )
                        (setf resp nil)
                    )
                    ( ; P nao inteiro -> -1^P nao e real
                      (and (< A 0) (not (integerp B)))
                        (if print_enabled
                          (print (format nil "~c[31m~a~c[0m" #\Escape "-n^p -> NUMERO COMPLEXO" #\Escape))
                        )
                        (setf resp nil)
                    )
                    (
                      T
                        (setf resp (EXPT A B))
                    )
                  )
            )
            
            (   ; A e um numero e B nao
                (numberp A)
                  (cond
                    ( ; 0^0  e  0^-1 -> 1/0^1 -> 1/0
                      (eq A 0)
                        (if print_enabled
                          (print (format nil "~c[33m~a > 0~c[0m" #\Escape B #\Escape))
                        )
                        (setf resp T)      
                    )
                    ( ; P nao inteiro -> -1^P nao e real
                      (< A 0)
                        (if print_enabled
                          (print (format nil "~c[33m~a e inteiro~c[0m" #\Escape B #\Escape))
                        )
                        (setf resp T)
                    )
                    (
                      T
                        (setf resp (format nil "~a^~a" A B))
                    )
                  )
            )
            (   ; A nao e um numero e B e numero
                (numberp B)
                  (cond
                    ( ; 0^-1 -> 1/0^1 -> 1/0
                      (<= B 0)
                        (if print_enabled
                          (print (format nil "~c[33m~a != 0~c[0m" #\Escape A #\Escape))
                        )
                        (setf resp T)      
                    )
                    ( ; P nao inteiro -> -1^P nao e real
                      (not (integerp B))
                        (if print_enabled
                          (print (format nil "~c[33m~a >= 0~c[0m" #\Escape A #\Escape))
                        )
                        (setf resp T)
                    )
                    ( 
                      T
                        (setf resp (format nil "~a^~a" A B))
                    )
                  )
            )

            (   ; nem A nem B sao numeros
                T   
                    (when print_enabled
                      (print (format nil "~c[33m~a != 0 ou ~a > 0~c[0m" #\Escape A B #\Escape))
                      (print (format nil "~c[33m~a >= 0 ou ~a e inteiro~c[0m" #\Escape A B #\Escape))                  
                    )

                    (setf resp (format nil "~a^~a" A B))
            )
        )

        (if (and (stringp resp) (require-parentheses 'INFIX:ELEV Op_anterior))
          (setf resp (format nil "(~a)" resp))
        )

        resp
    )
)

; CASO DE TESTE
; (INFIX:ELEV  'a  'b "NIL" T)      "a^b"
; (INFIX:ELEV  'a  'b "ADD" T)      "a^b"
; (INFIX:ELEV  'a  'b "MULT" T)     "a^b"
; (INFIX:ELEV  'a  'b "ELEV" T)    "(a^b)"
; (INFIX:ELEV  1  'b NIL T)       "1^b"
; (INFIX:ELEV  1  'b NIL T)       "1^b"
; (INFIX:ELEV  0   0 NIL T)       nil
; (INFIX:ELEV  0  -1 NIL T)       nil
; (INFIX:ELEV -1 3.1 NIL T)       nil








