#lang sicp

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (oringin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (caddr frame))

(define frame (make-frame 1 2 3))
(oringin-frame frame)
(edge1-frame frame)
(edge2-frame frame)

(define (make-frame1 origin edge1 edge2)
  (cons origin (cons edge1 edge2)))
(define (oringin-frame1 frame)
  (car frame))
(define (edge1-frame1 frame)
  (cadr frame))
(define (edge2-frame1 frame)
  (cddr frame))

(define frame1 (make-frame1 1 2 3))
(oringin-frame1 frame1)
(edge1-frame1 frame1)
(edge2-frame1 frame1)

