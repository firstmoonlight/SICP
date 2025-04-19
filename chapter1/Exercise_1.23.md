代码如下：
```
#lang sicp

(define (next n)
  (if (= 2 n)
      3
      (+ 2 n)))

(define (next-odd n)
  (if (odd? n)
      (+ 2 n)
      (+ 1 n)))

(define (continue-primes n count)
  (cond ((= 0 count)
         (newline))
        ((prime? n)
         (timed-prime-test n)
         (continue-primes (next-odd n) (- count 1)))
        (else
         (continue-primes (next-odd n) count))))
        
(define (square n) (* n n))

(define (smallest-divisor n test-v)
  (cond ((> (square test-v) n) n)
        ((= (remainder n test-v) 0) test-v)
        (else (smallest-divisor n (next test-v)))))

(define (prime? n)
  (= (smallest-divisor n 2) n))

(define (timed-prime-test n)
  (newline)
  (display n)
  (start-prime-test n (runtime)))
(define (start-prime-test n start-time)
  (if (prime? n)
      (report-prime (- (runtime) start-time))))

(define (report-prime elapse-time)
  (display " *** ")
  (display elapse-time))
```

结果显示，其耗时确实减少了
```
> (continue-primes 1000 3)

1009 *** 3
1013 *** 2
1019 *** 0
> (continue-primes 10000 3)

10007 *** 6
10009 *** 3
10037 *** 3
> (continue-primes 100000 3)

100003 *** 9
100019 *** 6
100043 *** 8
> (continue-primes 1000000 3)

1000003 *** 24
1000033 *** 21
1000037 *** 22
> 
```
