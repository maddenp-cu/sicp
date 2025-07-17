;; a = 1, b = 0, p = 0, q = 1
;; T1. a <- bq + aq + ap  b <- bp + aq
;; T2. a <- (bp + aq)q + (bq + aq + ap)q + (bq + aq + ap)p  b <- (bp + aq)p + (bq + aq + ap)q
;;     a <- bpq + aqq + bqq + aqq + apq + bpq + apq + app   b <- bpp + apq + bqq + aqq + apq
;;     [arrange to get form: bq' + aq' + ap', bp' + aq']
;;     a <- b(pq + qq + pq) + a(pq + qq + pq) + a(qq + pp), b <- b(pp + qq) + a(pq + qq + pq)
;;     a <- b(2pq + qq) + a(2pq + qq) + a(qq + pp), b <= b(pp + qq) + a(2pq + qq)
;;            \______/      \______/      \_____/          \_____/      \______/
;;               q'            q'            p'               p'           q'
;;
;; Expressions stolen from https://sicp.csrg.org/papers/kaldewaij-programming.pdf p91

(define (fib n)
  (define (fib-iter a b p q count)
    (cond ((= count 0) b)
          ((even? count)
           (fib-iter a
                     b
                     (+ (* p p) (* q q))
                     (+ (* 2 p q) (* q q))
                     (/ count 2)))
          (else
           (fib-iter (+ (* b q) (* a q) (* a p))
                     (+ (* b p) (* a q))
                     p
                     q
                     (- count 1)))))
  (fib-iter 1 0 0 1 n))

(fib 0) ; 0
(fib 1) ; 1
(fib 2) ; 1
(fib 3) ; 2
(fib 4) ; 3
(fib 5) ; 5
(fib 6) ; 8
(fib 7) ; 13
