(define zero
  (lambda (f) (lambda (x) x)))

(define (add-1 n)
  (lambda (f) (lambda (x) (f ((n f) x)))))

(define one
  (lambda (f) (lambda (x) (f x))))

(define two
  (lambda (f) (lambda (x) (f (f x)))))

(define (add-church-numerals m n)
  (lambda (f) (lambda (x) ((m f) ((n f) x)))))

(define three
  (add-church-numerals one two))


;; 1 ]=> ((one square) 2)
;; ;Value: 4

;; 1 ]=> ((two square) 2)
;; ;Value: 16

;; 1 ]=> ((three square) 2)
;; ;Value: 256

