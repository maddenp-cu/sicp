(define (product-i term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* result (term a)))))
  (iter a 1))

(define (identity n) n)
(define (inc n) (+ n 1))

(define (factorial n)
  (product-i identity 1 inc n))

(factorial 5)

(define (pi f n)
  (define (plus-2 n) (+ n 2))
  (define (term n) (* (/ (- n 1) n) (/ (+ n 1) n)))
  (* 4.0 (f term 3 plus-2 n)))

(pi product-i 100)
(pi product-i 1000)
(pi product-i 10000)

(define (product-r term a next b)
  (define (rec a)
    (if (> a b)
        1
        (* (term a) (rec (next a)))))
  (rec a))

(pi product-r 10000)
