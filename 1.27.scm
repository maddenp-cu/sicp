(define (fast-expt a n)
  (define (square n) (* n n))
  (cond ((= n 0) 1)
        ((even? n) (square (fast-expt a (/ n 2))))
        (else (* a (fast-expt a (- n 1))))))

(define (check a n)
  (= (remainder (fast-expt a n) n)
     (remainder a n)))
      
(define (loop a n p)
  (if p
      (let ((q (check a n)))
        (if (< a n)
            (loop (+ a 1) n (and p q))
            (and p q)))
      #f))

(define (tricky? n)
  (loop 1 n #t))

(map tricky? (list 561 1105 1729 2465 2821 6601))
