(define (identity n) n)
(define (inc n) (+ n 1))

;; iterative

(define (accumulate-i combiner null-value term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (combiner result (term a)))))
  (iter a null-value))

(define (product-i term a next b)
  (accumulate-i * 1 term a next b))

(define (sum-i term a next b)
  (accumulate-i + 0 term a next b))

(define (factorial-i n)
  (product-i identity 1 inc n))

(define (sum-integers-i n)
  (sum-i identity 1 inc n))

(factorial-i 5)
(sum-integers-i 5)

;; recursive

(define (accumulate-r combiner null-value term a next b)
  (define (rec a)
    (if (> a b)
        null-value
        (combiner (term a) (rec (next a)))))
  (rec a))

(define (product-r term a next b)
  (accumulate-r * 1 term a next b))

(define (sum-r term a next b)
  (accumulate-r + 0 term a next b))

(define (factorial-r n)
  (product-r identity 1 inc n))

(define (sum-integers-r n)
  (sum-r identity 1 inc n))

(factorial-r 5)
(sum-integers-r 5)
