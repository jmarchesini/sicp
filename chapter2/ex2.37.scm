(define (accumulate op initial sequence)
  (if (null? sequence)
       initial
       (op (car sequence)
           (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (row) (dot-product row v)) m))

(define (transpose mat)
  (accumulate-n cons '() mat))

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (row) (matrix-*-vector cols row)) m)))


;; 1 ]=> (define v (list 1 3 -5))
;; ;Value: v

;; 1 ]=> (define w (list 4 -2 -1))
;; ;Value: w

;; 1 ]=> (dot-product v w)
;; ;Value: 3

;; 1 ]=> (define m (list (list 1 2 3) (list 4 5 6)))
;; ;Value: m

;; 1 ]=> (define v (list 1 2 3))
;; ;Value: v

;; 1 ]=> (matrix-*-vector m v)
;; ;Value: (14 32)

;; 1 ]=> (define a (list
;;                       (list 14 9 3)
;;                       (list 2 11 15)
;;                       (list 0 12 17)
;;                       (list 5 2 3)))
;; ;Value: a

;; 1 ]=> (define b (list (list 12 25) (list 9 10) (list 8 5)))
;; ;Value: b

;; 1 ]=> (matrix-*-matrix a b)
;; ;Value: ((273 455) (243 235) (244 205) (102 160))
