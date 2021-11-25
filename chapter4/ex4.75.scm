(load "qinterpreter.scm")

(define (uniquely-asserted pattern frame-stream)
  (stream-flatmap
   (lambda (frame)
     (let ((stream (qeval (negated-query pattern)
                          (singleton-stream frame))))
       (if (singleton-stream? stream)
           stream
           the-empty-stream)))
   frame-stream))

(put 'unique 'qeval uniquely-asserted)
  
(define (singleton-stream? s)
  (and (not (stream-null? s))
       (stream-null? (stream-cdr s))))

;; all people who supervise precisely one person
;;
;; (and (supervisor ?person ?boss)
;;      (unique (supervisor ?other ?boss)))
