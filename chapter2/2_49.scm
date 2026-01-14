#lang sicp

(#%require sicp-pict)

(define frame-painter
  (segments->painter 
   (list (make-segment (make-vect 0.0 0.0) (make-vect 0.0 1.0))
         (make-segment (make-vect 0.0 1.0) (make-vect 1.0 1.0))
         (make-segment (make-vect 1.0 1.0) (make-vect 1.0 0.0))
         (make-segment (make-vect 1.0 0.0) (make-vect 0.0 0.0)))))

(define (frame-X-painter frame)
  (segments->painter 
   (list (make-segment (make-vect 0.0 0.0) (make-vect 1.0 1.0))
         (make-segment (make-vect 0.0 1.0) (make-vect 1.0 0.0)))))

;; 一个经典的 wave 实现
(define wave
  (segments->painter
   (list
    ;; 主体波浪线
    (make-segment (make-vect 0.00 0.85) (make-vect 0.15 0.60))
    (make-segment (make-vect 0.15 0.60) (make-vect 0.30 0.70))
    (make-segment (make-vect 0.30 0.70) (make-vect 0.40 0.70))
    (make-segment (make-vect 0.40 0.70) (make-vect 0.35 0.85))
    (make-segment (make-vect 0.35 0.85) (make-vect 0.40 1.00))
    
    (make-segment (make-vect 0.60 1.00) (make-vect 0.65 0.85))
    (make-segment (make-vect 0.65 0.85) (make-vect 0.60 0.70))
    (make-segment (make-vect 0.60 0.70) (make-vect 0.75 0.70))
    (make-segment (make-vect 0.75 0.70) (make-vect 1.00 0.40))
    
    ;; 底部线
    (make-segment (make-vect 0.00 0.70) (make-vect 0.15 0.50))
    (make-segment (make-vect 0.15 0.50) (make-vect 0.30 0.60))
    (make-segment (make-vect 0.30 0.60) (make-vect 0.45 0.50))
    (make-segment (make-vect 0.45 0.50) (make-vect 0.40 0.40))
    (make-segment (make-vect 0.40 0.40) (make-vect 0.50 0.30))
    
    (make-segment (make-vect 0.50 0.30) (make-vect 0.60 0.40))
    (make-segment (make-vect 0.60 0.40) (make-vect 0.75 0.40))
    (make-segment (make-vect 0.75 0.40) (make-vect 1.00 0.20))
    )))

(define origin (make-vect 0.0 0.0))
(define edge1  (make-vect 2.0 0.0))   ; 宽2
(define edge2  (make-vect 0.0 0.5))   ; 高0.5
(define rect-frame (make-frame origin edge1 edge2))
(paint frame-painter)
(paint wave)  ; 这会显示一个X

