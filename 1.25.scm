(define (square n) (* n n))

(define (expmod base exp m)
  (define (even? n) (= 0 (remainder n 2)))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fast-expt a n)
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt a (/ n 2))))
        (else (* a (fast-expt a (- n 1))))))

(define (expmod-new base exp m)
  (remainder (fast-expt base exp) m))

(define (time f)
  (define (usec)
    (let ((t (gettimeofday)))
      (+ (* 1000000 (car t)) (cdr t))))
  (let ((t0 (usec)))
    (f)
    (- (usec) t0)))

(define base 53982894593057)
(define exp 100043)
(define n 3)

(expmod base exp n)
(time (lambda () (expmod base exp n)))
(expmod-new base exp n)
(time (lambda () (expmod-new base exp n)))
