(define (cube x) (* x x x))
(define (p x)
  (format #t "p ~g~%" x)
  (- (* 3 x) (* 4 (cube x))))
(define (sine angle)
  (format #t "sine ~g~%" angle)
  (if (not (> (abs angle) 0.1))
      angle
      (p (sine (/ angle 3.0)))))

(sine 12.15)

;; 5 calls

;; angle / 3^x < 0.1
;;   angle / 0.1 < 3^x
;;   3^x > angle / 0.1
;;   3^x > 10 angle
;;   log(3^x) > log(10 angle)
;;   x log(3) > log(10 angle)
;;   x > log(10 angle) / log(3)

;; e.g. x > log(10 12.15) / log(3)
;;      x > 4.369, but x is a number of steps i.e. an integer, so
;;      x = 5

;; For complexity:
;;   log(10 angle) / log(3) =
;;   log(10) + log(angle) / log(3), and constants disappear, leaving
;;   θ(log(angle))

;; Process is linear recursive, so θ(log(angle)) for both time and space.
