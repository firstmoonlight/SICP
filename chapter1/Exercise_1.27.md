代码：
```
#lang sicp

(define (carmichael-test n)
  (test-iter 1 n))

(define (test-iter a n)
  (cond ((= n a) true)
        ((= (expmod a n n) a) (test-iter (+ 1 a) n))
        (else false)))

(define (expmod base exp m)
  (cond ((= 0 exp) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        ((odd? exp)
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (square n)
  (* n n))
```

按照书本 35 页脚注 47 里的 Carmichael 数一个个进行测试结果：
```
> (carmichael-test 561)
#t
> (carmichael-test 1105)
#t
> (carmichael-test 1729)
#t
> (carmichael-test 2465)
#t
> (carmichael-test 2821)
#t
> (carmichael-test 6601)
#t
```
