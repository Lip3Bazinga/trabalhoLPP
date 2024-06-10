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


(defun require-parentheses (A B)
    "Checa se para realizar A antes de B e necessario o uso de parenteses
    exemplo1: 1+2*4 != (1+2)*4
    e se queremos realizar 1+2 primeiro, devemos utilizar parenteses
    
    exemplo2: 1+2*4 == 1+(2*4)
    entao nesse caso nao e necessario o uso de parenteses
     
    (+ *) significa que + sera feito antes de *, nesse caso precisa de parenteses
    
    (* +) significa que * sera feito antes de +, nesse caso nao precisa

    log(a, b) tem parenteses intrincicos a operacao, bem como
    sin(x)
    cos(y)
    ln(x)
    ...
    "
    (cond
        ((and (eq A 'INFIX:ADD) (equal B "ADD"))    nil)
        ((and (eq A 'INFIX:ADD) (equal B "SUB"))    nil)
        ((and (eq A 'INFIX:ADD) (equal B "MULT"))   t)
        ((and (eq A 'INFIX:ADD) (equal B "DIV"))    t)
        ((and (eq A 'INFIX:ADD) (equal B "ELEV"))   t)

        ((and (eq A 'INFIX:SUB) (equal B "ADD"))    nil)
        ((and (eq A 'INFIX:SUB) (equal B "SUB"))    nil)
        ((and (eq A 'INFIX:SUB) (equal B "MULT"))   t)
        ((and (eq A 'INFIX:SUB) (equal B "DIV"))    t)
        ((and (eq A 'INFIX:SUB) (equal B "ELEV"))   t)

        ((and (eq A 'INFIX:MULT) (equal B "ADD"))   nil)
        ((and (eq A 'INFIX:MULT) (equal B "SUB"))   nil)
        ((and (eq A 'INFIX:MULT) (equal B "MULT"))  nil)
        ((and (eq A 'INFIX:MULT) (equal B "DIV"))   t)
        ((and (eq A 'INFIX:MULT) (equal B "ELEV"))  t)

        ((and (eq A 'INFIX:DIV) (equal B "ADD"))    nil)
        ((and (eq A 'INFIX:DIV) (equal B "SUB"))    nil)
        ((and (eq A 'INFIX:DIV) (equal B "MULT"))   nil)
        ((and (eq A 'INFIX:DIV) (equal B "DIV"))    t)
        ((and (eq A 'INFIX:DIV) (equal B "ELEV"))   t)

        ((and (eq A 'INFIX:ELEV) (equal B "ADD"))    nil)
        ((and (eq A 'INFIX:ELEV) (equal B "SUB"))    nil)
        ((and (eq A 'INFIX:ELEV) (equal B "MULT"))   nil)
        ((and (eq A 'INFIX:ELEV) (equal B "DIV"))    nil)
        ((and (eq A 'INFIX:ELEV) (equal B "ELEV"))   t)

        (t nil)    
    )
)