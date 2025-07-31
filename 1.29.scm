(define (cube x) (* x x x))

(define (sr f a b n)
  (define h (/ (- b a) n))
  (define (coeff k) (if (= 0 (remainder k 2)) 2 4))
  (define (y k) (f (+ a (* k h))))
  (define (sr-iter k)
    (if (> k n)
        (y 0)
        (+ (* (coeff k) (y k)) (sr-iter (+ k 1)))))
  (* (/ h 3.0) (sr-iter 1)))

(sr cube 0 1 100)
(sr cube 0 1 1000)
