(define (cont-frac-r n d k)
  (define (f i)
    (if (= i k)
        (/ (n i) (d i))
        (/ (n i) (+ (d i) (f (+ i 1))))))
  (f 1))

(define (cont-frac-i n d k)
  (define (f a i)
    (cond ((= i 1) (/ (n i) (+ (d i) a)))
          ((= i k) (f (/ (n i) (d i)) (- i 1)))
          (else (f (/ (n i) (+ (d i) a)) (- i 1)))))
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
