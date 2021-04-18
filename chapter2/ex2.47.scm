(define (make-frame-list origin edge1 edge2)
  (list origin edge1 edge2))

(define (origin-list frame)
  (car frame))

(define (edge1-list frame)
  (car (cdr frame)))

(define (edge2-list frame)
  (car (cdr (cdr frame))))

(define (make-frame-pair origin edge1 edge2)
  (cons origin (cons edge1 edge2)))

(define (origin-pair frame)
  (car frame))

(define (edge1-pair frame)
  (car (cdr frame)))

(define (edge2-pair frame)
  (cdr (cdr frame)))

;; (define l (make-frame-list (make-vect 0 0) (make-vect 2 4) (make-vect 3 1)))
;; ;Value: l

;; (define p (make-frame-pair (make-vect 0 0) (make-vect 2 4) (make-vect 3 1)))
;; ;Value: p

;; ]=> l
;; ;Value: ((0 . 0) (2 . 4) (3 . 1))

;; ]=> p
;; ;Value: ((0 . 0) (2 . 4) 3 . 1)

;; ]=> (origin-list l)
;; ;Value: (0 . 0)

;; ]=> (origin-pair p)
;; ;Value: (0 . 0)

;; ]=> (edge1-list l)
;; ;Value: (2 . 4)

;; ]=> (edge1-pair p)
;; ;Value: (2 . 4)

;; ]=> (edge2-list l)
;; ;Value: (3 . 1)

;; ]=> (edge2-pair p)
;; ;Value: (3 . 1)
