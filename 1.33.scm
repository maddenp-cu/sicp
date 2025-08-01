(define (identity n) n)
(define (inc n) (+ n 1))

(define (filtered-accumulate pred combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a)
              (combiner result (if (pred (term a)) (term a) null-value)))))
  (iter a null-value))

;; b

(define (gcd a b)
  (if (= b 0)
      a
      (gcd b (remainder a b))))

(define (product-of-relative-primes n)
  (define (relatively-prime? a)
    (= (gcd a n) 1))
  (filtered-accumulate relatively-prime? * 1 identity 2 inc n))

(product-of-relative-primes 8)
(* 3 5 7)

(product-of-relative-primes 20)
(* 3 7 9 11 13 17 19)
