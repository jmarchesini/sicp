(load "stream.scm")

(define (pairs s t)
  (interleave
   (stream-map
    (lambda (x) 
      (list (stream-car s) x))
    t)
   (pairs (stream-cdr s)
          (stream-cdr t))))


;; 1 ]=> (define l (pairs integers integers))

;; ;Aborting!: maximum recursion depth exceeded
