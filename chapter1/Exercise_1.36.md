代码
```
#lang sicp
(define tolerance 0.00001)
(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess step)
     (display-info guess step)
     (let ((next (f guess)))
      (if (close-enough? guess next)
          (begin
            (display-info next (+ 1 step))
            next)
          (try next (+ 1 step)))))
  (try first-guess 1))

(define (average-damp f) (lambda (x)
                           (average x (f x))))

(define (average x y) (/ (+ x y) 2))

(define (display-info guess step)
  (display "Step: ")
  (display step)
  (display " ")
  (display "Guess: ")
  (display guess)
  (newline))

(define formula 
    (lambda (x)
        (/ (log 1000) 
           (log x))))

(fixed-point formula 2.0)
(display "with damp")
(newline)
(fixed-point (average-damp formula) 2.0) 
```

结果显示，不带平均阻尼的计算使用了 41 步，另一方面，使用平均阻尼的计算只使用了 12 步，说明平均阻尼有助于计算快速收敛。
```
Welcome to DrRacket, version 8.15 [cs].
Language: sicp, with debugging; memory limit: 128 MB.
Step: 1 Guess: 2.0
Step: 2 Guess: 9.965784284662087
Step: 3 Guess: 3.004472209841214
Step: 4 Guess: 6.279195757507157
Step: 5 Guess: 3.759850702401539
Step: 6 Guess: 5.215843784925895
Step: 7 Guess: 4.182207192401397
Step: 8 Guess: 4.8277650983445906
Step: 9 Guess: 4.387593384662677
Step: 10 Guess: 4.671250085763899
Step: 11 Guess: 4.481403616895052
Step: 12 Guess: 4.6053657460929
Step: 13 Guess: 4.5230849678718865
Step: 14 Guess: 4.577114682047341
Step: 15 Guess: 4.541382480151454
Step: 16 Guess: 4.564903245230833
Step: 17 Guess: 4.549372679303342
Step: 18 Guess: 4.559606491913287
Step: 19 Guess: 4.552853875788271
Step: 20 Guess: 4.557305529748263
Step: 21 Guess: 4.554369064436181
Step: 22 Guess: 4.556305311532999
Step: 23 Guess: 4.555028263573554
Step: 24 Guess: 4.555870396702851
Step: 25 Guess: 4.555315001192079
Step: 26 Guess: 4.5556812635433275
Step: 27 Guess: 4.555439715736846
Step: 28 Guess: 4.555599009998291
Step: 29 Guess: 4.555493957531389
Step: 30 Guess: 4.555563237292884
Step: 31 Guess: 4.555517548417651
Step: 32 Guess: 4.555547679306398
Step: 33 Guess: 4.555527808516254
Step: 34 Guess: 4.555540912917957
Step: 35 Guess: 4.555532270803653
4.555532270803653
with damp
Step: 1 Guess: 2.0
Step: 2 Guess: 5.9828921423310435
Step: 3 Guess: 4.922168721308343
Step: 4 Guess: 4.628224318195455
Step: 5 Guess: 4.568346513136242
Step: 6 Guess: 4.5577305909237005
Step: 7 Guess: 4.555909809045131
Step: 8 Guess: 4.555599411610624
Step: 9 Guess: 4.5555465521473675
Step: 10 Guess: 4.555537551999825
4.555537551999825
> 
```
