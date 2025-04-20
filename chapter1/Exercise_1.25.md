代码：通过测试`expmod1`和`expmod2`，发现`expmod1`的速率很慢。
```
#lang sicp

(define (expmod1 base exp m)
 (remainder (fast-exp base exp) m))

(define (fast-exp base exp)
  (cond ((= 0 exp) 1)
        ((even? exp)
         (square (fast-exp base (/ exp 2))))
        ((odd? exp)
         (* base (fast-exp base (- exp 1))))))

(define (expmod2 base exp m)
  (cond ((= 0 exp) 1)
        ((even? exp)
         (remainder
          (square (expmod2 base (/ exp 2) m))
          m))
        ((odd? exp)
         (remainder
          (* base (expmod2 base (- exp 1) m))
          m))))

(define (square n)
  (* n n))
```


结果：
```
> (expmod2 1000000000  1000000000  3)
1
> (expmod1 1000000000  1000000000  3)
. Interactions disabled; out of memory
```
原因是因为求十亿的一亿次方，这种非常大的数值计算的速度非常慢，而且很容易因为超出实现的限制而造成溢出。

而书本 34 页的 expmod 函数，通过每次对乘幂进行 remainder 操作，从而将乘幂限制在一个很小的范围内（不超过参数 m ），这样可以最大限度地避免溢出，而且计算速度快得多。
