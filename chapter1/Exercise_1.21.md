```Lisp
#lang sicp
(define (square n) (* n n))
(define (smallest-divisor n test-v)
  (cond ((> (square test-v) n) n)
        ((= (remainder n test-v) 0) test-v)
        (else (smallest-divisor n (+ 1 test-v)))))
```

result : 

```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
> (smallest-divisor 199 2)
199
> (smallest-divisor 1999 2)
1999
> (smallest-divisor 19999 2)
7
> 
```
