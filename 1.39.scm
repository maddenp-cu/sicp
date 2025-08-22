(define (cf-neg n d k)
  (define (f a i)
    (let ((di (d i)) (ni (n i)) (j (- i 1)))
      (cond ((= i 1) (/ ni (- di a)))
            ((= i k) (f (/ ni di) j))
            (else (f (/ ni (- di a)) j)))))
  (f 0.0 k))

(define (tan-cf x k)
  (cf-neg (lambda (i) (if (= i 1) x (* x x)))
          (lambda (i) (- (* i 2) 1))
          k))

(define pi 3.14159265359)

(tan-cf (/ pi 4) 8) ; tan π/4 = 1
