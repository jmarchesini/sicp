(load "constraint.scm")

(define (squarer a b)
  (define (process-new-value)
    (if (has-value? b)
        (if (< (get-value b) 0)
            (error "square less than 0: SQUARER" 
                   (get-value b))
            (set-value! a (sqrt (get-value b)) me))
        (if (has-value? a)
            (set-value! b (* (get-value a)
                             (get-value a)) me))))
  
  (define (process-forget-value)
    (forget-value! a me)
    (forget-value! b me)
    (process-new-value))

  (define (me request)
    (cond ((eq? request 'I-have-a-value)
           (process-new-value))
          ((eq? request 'I-lost-my-value)
           (process-forget-value))))
  
  (connect a me)
  (connect b me)
  me)


;; 1 ]=> (set-value! a 7 'a)
;; ;Value: done

;; 1 ]=> (get-value b)
;; ;Value: 49

;; 1 ]=> (forget-value! a 'a)
;; ;Value: done

;; 1 ]=> (set-value! b 25 'b)
;; ;Value: done

;; 1 ]=> (get-value a)
;; ;Value: 5
