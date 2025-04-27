代码：
```
#lang sicp
;a
(define (cont-frac n d k)
  (define (cont-frac-helper i)
    (if (= k i)
         (/ (n i) (d i))
        (/ (n i) (+ (d i) (cont-frac-helper (+ i 1))))))
  (cont-frac-helper 1))

(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           1000)
(cont-frac (lambda (i) 1.0)
           (lambda (i) 1.0)
           10000)

;b
(define (cont-frac-iter n d k)
  (define (cont-frac-iter-helper n d k result)
    (if (= k 0)
         result
         (let ((i (- k 1)))
           (cont-frac-iter-helper n d i (/ (n i) (+ (d i) result))))))
  (cont-frac-iter-helper n d k 0))

(display "iter version")
(newline)
(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           10)
(cont-frac-iter (lambda (i) 1.0)
           (lambda (i) 1.0)
           100)
  
```

结果：
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
0.6179775280898876
0.6180339887498948
0.6180339887498948
0.6180339887498948
iter version
0.6179775280898876
0.6180339887498948
> 
```
