
这段代码借鉴了习题答案[1.16](https://sicp.readthedocs.io/en/latest/chp1/16.html)

```Lisp

(define (fast-expt b n)
    (expt-iter b n 1))

(define (expt-iter b n a)
    (cond ((= n 0)
            a)
          ((even? n)
            (expt-iter (square b)
                       (/ n 2)
                       a))
          ((odd? n)
            (expt-iter b
                       (- n 1)
                       (* b a)))))
```
