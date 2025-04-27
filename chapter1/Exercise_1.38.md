代码：
```
#lang sicp
(define (cont-frac-iter n d k)
  (define (cont-frac-iter-helper n d k result)
    (if (= k 0)
         result
         (let ((i (- k 1)))
           (cont-frac-iter-helper n d i (/ (n i) (+ (d i) result))))))
  (cont-frac-iter-helper n d k 0))

(+ 2 (cont-frac-iter (lambda (i) 1.0)
                (lambda (i) (if (= 0 (remainder (- i 1) 3))
                                (* (+ 1 (/ (- i 1) 3)) 2)
                                1))
                100))
```

结果：
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
2.7182818284590455
> 
```
