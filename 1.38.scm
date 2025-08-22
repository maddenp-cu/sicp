(define (cont-frac n d k)
  (define (f a i)
    (let ((di (d i)) (ni (n i)) (j (- i 1)))
      (cond ((= i 1) (/ ni (+ di a)))
            ((= i k) (f (/ ni di) j))
            (else (f (/ ni (+ di a)) j)))))
  (f 0 k))

(define (e k)
  (+ 2.0 (cont-frac (lambda (i) 1)
                    (lambda (i) (if (= 2 (remainder i 3)) (* (+ (quotient i 3) 1) 2) 1))
                    k)))

;; e =~ 2.71828

(e 9)

;;  i  d
;;  -  -
;;  1  1
;;  2  2  0
;;  3  1
;;  4  1
;;  5  4  1
;;  6  1
;;  7  1
;;  8  6  2
;;  9  1
;; 10  1
;; 11  8  3
;; 12  1
;; 13  1
;; 14 10  4
