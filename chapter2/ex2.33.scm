(define (accumulate op initial sequence)
   (if (null? sequence)
       initial
       (op (car sequence)
           (accumulate op initial (cdr sequence)))))

(define (my-map p sequence)
  (accumulate (lambda (x y) (cons (p x) y)) '() sequence))

;; 1 ]=> (my-map square (list 1 2 3 4))
;; ;Value: (1 4 9 16)

(define (my-append seq1 seq2)
  (accumulate cons seq2 seq1))

;; 1 ]=> (my-append (list 1 2 3) (list 4 5 6))
;; ;Value: (1 2 3 4 5 6)

(define (my-length seq)
  (accumulate (lambda (x y) (+ 1 y)) 0 seq))

;; 1 ]=> (my-length (list 1 2 3 4))
;; ;Value: 4
