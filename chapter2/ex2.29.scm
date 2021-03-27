(define (make-mobile left right)
  (cons left right))

(define (left-branch mobile)
  (car mobile))

(define (right-branch mobile)
  (cdr mobile))

(define (make-branch length structure)
  (cons length structure))

(define (branch-length branch)
  (car branch))

(define (branch-structure branch)
  (cdr branch))

(define (total-weight mobile)
  (cond ((null? mobile) 0)
        ((not (pair? mobile)) mobile)
        (else (+ (total-weight (branch-structure (left-branch mobile)))
                 (total-weight (branch-structure (right-branch mobile)))))))

(define (branch-torque branch)
  (* (branch-length branch)
     (total-weight (branch-structure branch))))

(define (balanced? mobile)
  (if (not (pair? mobile))
      true
      (and (= (branch-torque (left-branch mobile))
              (branch-torque (right-branch mobile)))
           (balanced? (branch-structure (left-branch mobile)))
           (balanced? (branch-structure (right-branch mobile))))))


;; 1 ]=> (define a (make-mobile (make-branch 2 3) (make-branch 2 3)))
;; 1 ]=> (total-weight a)
;; ;Value: 6

;; 1 ]=> (define l (left-branch a))
;; 1 ]=> l
;; ;Value: (2 . 3)

;; 1 ]=> (branch-torque l)
;; ;Value: 6

;; 1 ]=> (define r (right-branch a))
;; 1 ]=> r
;; ;Value: (2 . 3)

;; 1 ]=> (branch-torque r)
;; ;Value: 6

;; 1 ]=> (balanced? a)
;; ;Value: #t

;; 1 ]=> (define b (make-mobile (make-branch 10 a) (make-branch 12 5)))
;; 1 ]=> (balanced? b)
;; ;Value: #t
