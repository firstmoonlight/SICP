#lang sicp

(define (equal1? lhs rhs)
  (cond ((and (not (pair? lhs)) (pair? rhs)) #f)
        ((and (pair? lhs) (not (pair? rhs))) #f)
        ((and (not (pair? lhs)) (not (pair? rhs))) (eq? lhs rhs))
        (else
         (and (equal1? (car lhs) (car rhs))
              (equal1? (cdr lhs) (cdr rhs))))))
        
(equal? 1 2)
(equal1? '(this is a list) '(this (is a) list))