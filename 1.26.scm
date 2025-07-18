;; The original version halves the exponent at every recursive step, generating
;; a θ(log n) linear recursive process, like 8 -> 4 -> 2 -> 1, as Eva says. The
;; new version creates duplicate subtrees at every recursive step. A log n long
;; chain in the original becomes a log n deep tree in the new version. A full
;; binary tree of depth k has 2^k-1 nodes. Let k = log n, then 2^(log2 n)-1 =
;; n-1, so there are n-1 nodes, each of which involves a multiplication, so this
;; becomes a θ(n) process.

