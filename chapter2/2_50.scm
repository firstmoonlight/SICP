#lang sicp

(#%require sicp-pict)

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

(define (scale-vect s vect)
  (make-vect
   (* s (xcor-vect vect))
   (* s (ycor-vect vect))))

(define (make-frame origin edge1 edge2)
  (list origin edge1 edge2))
(define (origin-frame frame)
  (car frame))
(define (edge1-frame frame)
  (cadr frame))
(define (edge2-frame frame)
  (caddr frame))

(define (frame-coord-map frame)
  (lambda (v)
    (add-vect
     (origin-frame frame)
     (add-vect (scale-vect (xcor-vect v) (edge1-frame frame))
               (scale-vect (ycor-vect v) (edge2-frame frame))))))

(define (transform-painter painter origin corner1 corner2)
  (lambda (frame)
    (let ((m (frame-coord-map frame)))
      (let ((new-origin (m origin)))
        (painter (make-frame
                  new-origin
                  (sub-vect (m corner1) new-origin)
                  (sub-vect (m corner2) new-origin)))))))

(define (flip-vert painter)
  (transform-painter painter
                     (make-vect 0.0 1.0)
                     (make-vect 1.0 1.0)
                     (make-vect 0.0 0.0)))

(define frame (make-frame (make-vect 0.0 0.0) (make-vect 0.0 1.0) (make-vect 1.0 0.0)))
(paint (flip-vert einstein))