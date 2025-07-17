(define (fr n)
  (cond ((< n 3) n)
        (else (+ (fr (- n 1))
                 (fr (- n 2))
                 (fr (- n 3))))))

"recursive"
(fr 1)
(fr 2)
(fr 3)
(fr 4)
(fr 10)

(define (fi n)
  (define (fi-iter a b c n)
    (if (= 0 n)
        c
        (fi-iter (+ a b) (+ b c) b (- n 1))))
  (fi-iter 2 1 0 n))

"iterative"
(fr 1)
(fr 2)
(fr 3)
(fr 4)
(fr 10)
