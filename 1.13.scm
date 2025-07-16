;; Step 1: Prove that fib(n) = (φ^n - ψ^n) / √5
;;
;;         Base case n=0: (φ^0 - ψ^0) / √5 = (1 - 1) / √5
;;                                         = 0 / √5
;;                                         = 0
;;                                         = fib(0) ✓
;;         Base case n=1: (φ^1 - ψ^1) / √5 = ((1 + √5) / 2 - (1 - √5) / 2) / √5
;;                                         = (2√5/2) / √5
;;                                         = √5 / √5
;;                                         = 1
;;                                         = fib(1) ✓
;;         Induction: fib(k+1) + fib(k) = (φ^(k+1) - ψ^(k+1)) / √5 + (φ^k - ψ^k) / √5
;;                                      = (φ(φ^k) - ψ(ψ^k) + φ^k - ψ^k) / √5
;;                                      = (φ(φ^k) + φ^k - (ψ(ψ^k) + ψ^k)) / √5
;;                                      = (φ^k(φ + 1) - ψ^k(ψ + 1)) / √5
;;                                      = (φ^k((1 + √5) / 2 + 1) - ψ^k((1 - √5) / 2 + 1)) / √5
;;                                      = (φ^k((1 + √5) / 2 + 2/2) - ψ^k((1 - √5) / 2 + 2/2)) / √5
;;                                      = (φ^k((3 + √5) / 2) - ψ^k((3 - √5) / 2)) / √5
;;           (Note: φ^2 = (1 + √5) / 2 x (1 + √5) / 2 = (1 + 2√5 + 5) / 4 = (6 + 2√5) / 4 = (3 + √5) / 2, likewise
;;                  ψ^2 =                                                                   (3 - √5) / 2, so...)
;;                                      = (φ^k φ^2 - ψ^k ψ^2) / √5
;;                                      = (φ^(k+2) - ψ^(k+2)) / √5
;;                                      = fib(k+2) [QED]
;;
;; Step 2: Prove that no integer is closer to fib(n), aka (φ^n - ψ^n) / √5, than φ^n/√5
;;         Consider the difference: |(φ^n - ψ^n) / √5 - φ^n / √5| = |-ψ^n / √5|
;;                                                                = |-((1 - √5) / 2)^n / √5|
;;                                                                < 0.62^n / √5
;;         This value is greatest when n=0, or ~1/√5 or ~0.45. For all n>0, the difference is even smaller.
;;         That is, the difference between fib(n) and φ^n/√5 is always < 0.45, so no integer is closer. QED.

