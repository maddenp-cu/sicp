(define (f g) (g 2))

(f f)

;; MIT Scheme says:
;; *** ERROR IN f, console@1:15 -- Operator is not a PROCEDURE

;; guile says:
;; ERROR: Wrong type to apply: 2

;; g should be a function that takes 2 as an argument, but f is a function that
;; takes a function as an argument, so f cannot be supplied as the argument to
;; f.
