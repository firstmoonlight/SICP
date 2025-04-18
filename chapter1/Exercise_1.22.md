1、 代码如下，我们每次计算得到prime之后，再调用`timed-prime-test`。
```
#lang sicp

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
        (else (smallest-divisor n (+ 1 test-v)))))

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

2、查看测试结果可以看出，数据每增加100倍，还是增加10倍
```
> (continue-primes 1000 3)

1009 *** 4
1013 *** 1
1019 *** 2
> (continue-primes 10000 3)

10007 *** 6
10009 *** 3
10037 *** 3
> (continue-primes 100000 3)

100003 *** 15
100019 *** 10
100043 *** 13
> (continue-primes 1000000 3)

1000003 *** 36
1000033 *** 26
1000037 *** 35
> (continue-primes 10000000 3)

10000019 *** 83
10000079 *** 83
10000103 *** 88
> 
```
