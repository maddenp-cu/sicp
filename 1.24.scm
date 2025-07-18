(define (expmod base exp m)
  (define (square n) (* n n))
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((= times 0) #t)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else #f)))

(define (prime? n) (fast-prime? n 10))

(define (time f)
  (define (usec)
    (let ((t (gettimeofday)))
      (+ (* 1000000 (car t)) (cdr t))))
  (let ((t0 (usec)))
    (f)
    (- (usec) t0)))

(format #t "~d~%" (time (lambda () (prime? 1019))))
(format #t "~d~%" (time (lambda () (prime? 100043))))
(format #t "~d~%" (time (lambda () (prime? 1000037))))

;;; 11
;;; $1 = #t
;;; 12
;;; $2 = #t
;;; 14
;;; $3 = #t
