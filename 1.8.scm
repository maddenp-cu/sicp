(define (improve x y)
  (/ (+ (/ x (* y y)) (* 2 y)) 3))

(define (sufficiently-improved? y' y)
  (< (/ (abs (- y' y)) y) 0.00001))

(define (cube-root-iter y' y x)
  (if (sufficiently-improved? y' y)
      y
      (cube-root-iter y (improve x y) x)))

(define (cube-root x)
  (cube-root-iter 2.0 1.0 x))

(cube-root 8)

"small"
(define small 0.0000001)
(cube-root small)
(expt small 1/3)

"large"
(define large 10000000000000)
(cube-root large)
(expt large 1/3)
