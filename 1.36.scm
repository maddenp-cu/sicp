(define (average a b) (/ (+ a b) 2))

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2)) tolerance))
  (define (try guess n)
    (format #t "~5a ~a~%" n guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next (+ n 1)))))
  (try first-guess 1))

(define (f x) (/ (log 1000) (log x)))

(fixed-point (lambda (x) (f x)) 1.1)
(fixed-point (lambda (x) (average x (f x))) 1.1)
