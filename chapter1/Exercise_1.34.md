执行表达式 (f f) 会造成错误。

代码：
```
#lang sicp
(define (f g) (g 2))
```

结果
```
> (f f)
. . application: not a procedure;
 expected a procedure that can be applied to arguments
  given: 2
> 
```

解释：当我们用substitute modle来进行替换之后，可以得到如下的调用链

(f f) -> (f 2) -> (2 2)

很显然，number 2并不是一个procedure，所以会报错。
