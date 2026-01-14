#lang sicp


#|
Louis 的版本低效是因为它重复计算了相同的子问题(递归调用)

原版(高效): 
计算 queen-cols(3):
1. 先算 queen-cols(2) 一次 → 得到所有2列的解
2. 对每个2列的解,尝试添加第3列的所有行
3. 过滤

Louis版(低效):
计算 queen-cols(3):
1. 对第3列的每一行(board-size 次):
   1.1 重新计算 queen-cols(2) ← 这会被重复计算 board-size 次!
   1.2 尝试组合
2. 过滤

时间复杂度:
T0(k) = O(board-size^k)   (正常指数)
Tl(k) = O(board-size^k × Tl(k-1)) = O(board-size^(k(k+1)/2))
|#