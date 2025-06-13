(define (square a)
  (* a a))

(define (sum-of-squares a b)
  (+ (square a) (square b)))

(define (f a b c)
  (cond ((or (< a b) (< a c)) (sum-of-squares b c))
        ((or (< b a) (< b c)) (sum-of-squares a c))
        (else (sum-of-squares a b))))

(f 3 1 2)
