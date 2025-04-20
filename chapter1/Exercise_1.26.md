代码：
```Lisp
(define (expmod base exp m)
 (cond ((= exp 0) 1)
 ((even? exp)
 (remainder (* (expmod base (/ exp 2) m)
 (expmod base (/ exp 2) m))
 m))
 (else
 (remainder (* base
 (expmod base (- exp 1) m))
 m))))
```
解释：使用square的时候，`(expmod base (/ exp 2) m)`只需要计算一次，而使用`*`的话，这个表达式需要计算两次。
所以每次当 exp 为偶数时， Louis 的 expmod 过程的计算量就会增加一倍，因此原本 Θ(logn) 的计算过程变成了 Θ(n)
