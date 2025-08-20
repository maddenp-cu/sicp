;; Show that ϕ is a fixed point of x -> 1 + 1/x 
;;   At the fixed point:
;;     x = 1 + 1/x
;;     x^2 = x + 1 ; multiply both sides by x
;;     ϕ^2 = ϕ + 1 ; let x = ϕ
;;   Since, "ϕ satisfies ϕ^2 = ϕ + 1" QED.

;; ϕ = (1 + √5) / 2 =~ 1.6180

(define tolerance 0.00001)

(define (fixed-point f first-guess)
  (define (close-enough? v1 v2)
    (< (abs (- v1 v2))
       tolerance))
  (define (try guess)
    (let ((next (f guess)))
      (if (close-enough? guess next)
          next
          (try next))))
  (try first-guess))

(fixed-point (lambda (x) (+ 1 (/ 1 x))) 1.0)
