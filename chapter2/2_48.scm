#lang sicp

(define (make-vect xcor ycor)
  (cons xcor ycor))

(define (xcor-vect vector)
  (car vector))

(define (ycor-vect vector)
  (cdr vector))

(define (add-vect vect1 vect2)
  (make-vect
   (+ (xcor-vect vect1) (xcor-vect vect2))
   (+ (ycor-vect vect1) (ycor-vect vect2))))

(define (sub-vect vect1 vect2)
  (make-vect
   (- (xcor-vect vect1) (xcor-vect vect2))
   (- (ycor-vect vect1) (ycor-vect vect2))))

(define (scale-vect vect s)
  (make-vect
   (* s (xcor-vect vect))
   (* s (ycor-vect vect))))

(define (make-segment vect1 vect2)
  (cons vect1 vect2))

(define (start-segment seg)
  (car seg))

(define (end-segment seg)
  (cdr seg))
