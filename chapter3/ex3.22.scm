(define (make-queue)
  (let ((front-ptr '())
        (rear-ptr '()))
    
    (define (set-front-ptr! item)
      (set! front-ptr item))

    (define (set-rear-ptr! item)
      (set! rear-ptr item))

    (define (empty-queue?)
      (null? front-ptr))

    (define (front-queue)
      (if (empty-queue?)
          (error "FRONT called with an empty queue")
          (car front-ptr)))

    (define (insert-queue! item)
      (let ((new-pair (cons item '())))
        (cond ((empty-queue?)
               (set-front-ptr! new-pair)
               (set-rear-ptr! new-pair))
              (else
               (set-cdr! rear-ptr new-pair)
               (set-rear-ptr! new-pair)))
        front-ptr))

    (define (delete-queue!)
      (cond ((empty-queue?)
             (error "DELETE! called with an empty queue"))
            (else
             (set-front-ptr! (cdr front-ptr))))
      front-ptr)

    (define (dispatch m) 
      (cond ((eq? m 'empty-queue?) (empty-queue?)) 
            ((eq? m 'front-queue) (front-queue)) 
            ((eq? m 'insert-queue!) insert-queue!) 
            ((eq? m 'delete-queue!) (delete-queue!)) 
            (else (error "Undefined oepration"))))
    
    dispatch))


;; 1 ]=> (define q (make-queue))
;; ;Value: q

;; 1 ]=> q
;; ;Value: #[compound-procedure 13 dispatch]

;; 1 ]=> (q 'empty-queue?)
;; ;Value: #t

;; 1 ]=> ((q 'insert-queue!) 3)
;; ;Value: (3)

;; 1 ]=> ((q 'insert-queue!) 5)
;; ;Value: (3 5)

;; 1 ]=> ((q 'insert-queue!) 7)
;; ;Value: (3 5 7)

;; 1 ]=> (q 'empty-queue?)
;; ;Value: #f

;; 1 ]=> (q 'delete-queue!)
;; ;Value: (5 7)

;; 1 ]=> (q 'delete-queue!)
;; ;Value: (7)

;; 1 ]=> (q 'delete-queue!)
;; ;Value: ()

;; 1 ]=> (q 'empty-queue?)
;; ;Value: #t
