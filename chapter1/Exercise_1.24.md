代码：
```
#lang sicp
(define (continue-primes n count)
  (cond ((= 0 count)
         (newline))
        ((fast-prime? n 10)
         (timed-prime-test n)
         (continue-primes (next-odd n) (- count 1)))
        (else
         (continue-primes (next-odd n) count))))

(define (next-odd n)
  (if (odd? n)
      (+ 2 n)
      (+ 1 n)))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (if (fast-prime? n 10)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapse-time)
  (display " *** ")
  (display elapse-time))

(define (fast-prime? n times)
  (cond ((= 0 times) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

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

结果：从耗时分析，可知在数据量较小的情况下，`fast-prime`并不占据优势，其耗时可能相对其其它方法更慢，但是随着数据量的增大，`fast-prime`的优势就愈发明显，其耗时增长的很慢。
```
> (continue-primes 10000 3)

10007 *** 15
10009 *** 10
10037 *** 11
> (continue-primes 100000 3)

100003 *** 18
100019 *** 13
100043 *** 13
> (continue-primes 1000000 3)

1000003 *** 18
1000033 *** 14
1000037 *** 15
> (continue-primes 10000000 3)

10000019 *** 23
10000079 *** 19
10000103 *** 21
> (continue-primes 100000000 3)

100000007 *** 23
100000037 *** 19
100000039 *** 21
> 
``
