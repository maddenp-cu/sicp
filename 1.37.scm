(define (cont-frac-r n d k)
  (define (f i)
    (let ((di (d i)) (ni (n i)))
      (if (= i k)
          (/ ni di)
          (/ ni (+ di (f (+ i 1)))))))
  (f 1))

(define (cont-frac-i n d k)
  (define (f a i)
    (let ((di (d i)) (ni (n i)) (j (- i 1)))
      (cond ((= i 1) (/ ni (+ di a)))
            ((= i k) (f (/ ni di) j))
            (else (f (/ ni (+ di a)) j)))))
  (f 0 k))

(define (phi k f)
  (/ 1 (f (lambda (i) 1.0)
          (lambda (i) 1.0)
          k)))

(define (phi-r k) (phi k cont-frac-r))
(define (phi-i k) (phi k cont-frac-i))

;; ϕ = (1 + √5) / 2 =~ 1.6180

(phi-r 13)
(phi-i 13)
