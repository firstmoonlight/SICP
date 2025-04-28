代码如下，值得注意的是，procedure作为返回值的时候，我们以lambda作为返回值，其变量x是lambda的参数
```
#lang sicp
(define (square x) (* x x))
(define (cube x) (* x x x))
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))
(define (deriv g)
  (lambda (x) (/ (- (g (+ x dx)) (g x)) dx)))
(define dx 0.00001)
(define (newton-transform g)
  (lambda (x) (- x (/ (g x) ((deriv g) x)))))
(define (newtons-method g guess)
  (fixed-point (newton-transform g) guess))

(define (cubic a b c)
  (lambda (x)
    (+ (cube x)
       (* a (square x))
       (* b x)
       c)))

(newtons-method (cubic 3 2 1) 1.0)
(newtons-method (cubic 2 5 5) 1.0)
```

结果：
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
-2.3247179572447267
-1.2332293376819243
> 
```
