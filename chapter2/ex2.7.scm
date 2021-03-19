(define (add-interval x y)
  (make-interval (+ (lower-bound x) (lower-bound y))
                 (+ (upper-bound x) (upper-bound y))))

(define (sub-interval x y)
  (make-interval (- (lower-bound x) (upper-bound y))
                 (- (upper-bound x) (lower-bound y))))

(define (mul-interval x y)
  (let ((p1 (* (lower-bound x) (lower-bound y)))
        (p2 (* (lower-bound x) (upper-bound y)))
        (p3 (* (upper-bound x) (lower-bound y)))
        (p4 (* (upper-bound x) (upper-bound y))))
    (make-interval (min p1 p2 p3 p4)
                   (max p1 p2 p3 p4))))

(define (div-interval x y)
  (mul-interval x
                (make-interval (/ 1.0 (upper-bound y))
                               (/ 1.0 (lower-bound y)))))

(define (spans-zero? y)
  (and (<= (lower-bound y) 0)
       (>= (upper-bound y) 0)))

(define (div-interval-2 x y)
  (if (spans-zero? y)
      (error "Error: The denominator should not span 0.")
      (mul-interval x
                    (make-interval (/ 1.0 (upper-bound y))
                                   (/ 1.0 (lower-bound y))))))

(define (make-interval a b)
  (cons a b))

(define (upper-bound interval)
  (cdr interval))

(define (lower-bound interval)
  (car interval))

(define (mul-interval-2 x y)
  (let ((xlo (lower-bound x))
        (xhi (upper-bound x))
        (ylo (lower-bound y))
        (yhi (upper-bound y)))
    (cond ((and (>= xlo 0)
                (>= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ;; [+, +] * [+, +]
           (make-interval (* xlo ylo) (* xhi yhi)))
          ((and (>= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ;; [+, +] * [-, +]
           (make-interval (* xhi ylo) (* xhi yhi)))
          ((and (>= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ;; [+, +] * [-, -]
           (make-interval (* xhi ylo) (* xlo yhi)))
          ((and (<= xlo 0)
                (>= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ;; [-, +] * [+, +]
           (make-interval (* xlo yhi) (* xhi yhi)))
          ((and (<= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ;; [-, +] * [-, +]
           (make-interval (min (* xhi ylo) (* xlo yhi))
                          (max (* xlo ylo) (* xhi yhi))))
          ((and (<= xlo 0)
                (>= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ;; [-, +] * [-, -]
           (make-interval (* xhi ylo) (* xlo ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (>= ylo 0)
                (>= yhi 0))
           ;; [-, -] * [+, +]
           (make-interval (* xlo yhi) (* xhi ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (<= ylo 0)
                (>= yhi 0))
           ;; [-, -] * [-, +]
           (make-interval (* xlo yhi) (* xlo ylo)))
          ((and (<= xlo 0)
                (<= xhi 0)
                (<= ylo 0)
                (<= yhi 0))
           ;; [-, -] * [-, -]
           (make-interval (* xhi yhi) (* xlo ylo))))))


;; 2.7
;; 1 ]=> (define i (make-interval 2 4))
;; 1 ]=> (define j (make-interval 6 8))

;; 1 ]=> (upper-bound i)
;; ;Value: 4

;; 1 ]=> (lower-bound i)
;; ;Value: 2

;; 1 ]=> (add-interval i j)
;; ;Value: (8 . 12)

;; 1 ]=> (mul-interval i j)
;; ;Value: (12 . 32)

;; 1 ]=> (div-interval i j)
;; ;Value: (.25 . .6666666666666666)


;; 2.8
;; 1 ]=> (sub-interval j i)
;; ;Value: (2 . 6)
