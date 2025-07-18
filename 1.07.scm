(define real-sqrt sqrt)

(define (average x y)
  (/ (+ x y) 2))

(define (square x)
  (* x x))

(define (good-enough? guess x)
  (< (abs (- (square guess) x)) 0.001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (sqrt-iter guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))

(define delta 0.00001)

(define (sufficiently-improved? last-guess this-guess)
  (< (/ (abs (- last-guess this-guess)) this-guess) delta))

(define (sqrt-iter-2 last-guess this-guess x)
  (if (sufficiently-improved? last-guess this-guess)
      this-guess
      (sqrt-iter-2 this-guess (improve this-guess x) x)))

(define (sqrt-2 x)
  (sqrt-iter-2 2.0 1.0 x))

"small"
(define small 0.0000001)
(sqrt small)
(real-sqrt small)
(sqrt-2 small)
(abs (- (sqrt-2 small) (real-sqrt small)))
"large"
(define large 10000000000000)
;;; (sqrt large) ; infinite loop
(real-sqrt large)
(sqrt-2 large)
(abs (- (sqrt-2 large) (real-sqrt large)))
