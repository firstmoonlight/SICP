代码：
**因为在计算 a的n−1次方时只有一半的几率会遇到 1取模 n的非平凡方根，因此我们至少要执行测试 n/2 次才能保证测试结果的准确性** --- 这段话暂时不明白
```
#lang sicp

(define (Miller-Rabin-test n)
  (let ((times (ceiling (/ n 2))))
    (test-iter n times)))

(define (test-iter n times)
  (cond ((= times 0) true)
        ((= (expmod (non-zero-random n) (- n 1) n) 1)
         (test-iter n (- times 1)))
        (else
         false)))
        
(define (expmod base exp m)
  (cond ((= 0 exp) 1)
        ((nontrivial-square-root? base m) 0)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        ((odd? exp)
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (nontrivial-square-root? a n)
  (cond ((= 1 a) false)
        ((= a (- n 1)) false)
        ((= 1 (remainder (square a) n)) true)
        (else false)))

(define (nontrivial-square-root2? a n)
  (and (not (= 1 a))
       (not (= a (- n 1)))
       (= 1 (remainder (square a) n))))

(define (non-zero-random n)
  (let ((r (random n)))
    (if (not (= r 0))
        r
        (non-zero-random n))))

(define (square n)
  (* n n))

```
结果：从结果可以看到Carmichael 数无法通过 Miller-Rabin 测试，但是真正的素数可以。
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
> (Miller-Rabin-test 7)
#t
> (Miller-Rabin-test 561)
#f
> (Miller-Rabin-test 1105)
#f
> (Miller-Rabin-test 1729)
#f
> (Miller-Rabin-test 2465)
#f
> (Miller-Rabin-test 17)
#t
> (Miller-Rabin-test 19)
#t
> 
```
