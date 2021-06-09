(define (make-monitored f)
  (let ((count 0))
    (lambda (arg)
      (cond ((equal? arg 'how-many-calls?) count)
            ((eq? arg 'reset-count)
             (set! count 0))
             (else
              (begin (set! count (+ count 1))
                     (f arg)))))))


;; 1 ]=> (define s (make-monitored sqrt))
;; ;Value: s

;; 1 ]=> (s 100)
;; ;Value: 10

;; 1 ]=> (s 'how-many-calls?)
;; ;Value: 1

;; 1 ]=> (s 144)
;; ;Value: 12

;; 1 ]=> (s 'how-many-calls?)
;; ;Value: 2
