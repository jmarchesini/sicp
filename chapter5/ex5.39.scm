;; ctor and selectors for lexaddr
(define (make-lexaddr frame displacement)
  (list frame displacement))

(define (lexaddr-frame lexaddr)
  (car lexaddr))

(define (lexaddr-displacement lexaddr)
  (cadr lexaddr))

(define (lexical-address-lookup lexaddr rtenv)
  (let ((frame (list-ref rtenv (lexaddr-frame lexaddr))))
    (let ((val (list-ref (frame-values frame) (lexaddr-displacement lexaddr))))
      (if (eq? val '*unassigned*)
          (error "Value is unassigned")
          val))))

(define (lexical-address-set! lexaddr rtenv val)
  (let ((frame (list-ref rtenv (lexaddr-frame lexaddr))))
    (define (iter vals count)
      (cond ((null? vals) (error "Bad coordinates"))
            ((= count 0) (set-car! vals val))
            (else (iter (cdr vals) (+ 1 count)))))
    (iter (frame-values frame) (lexaddr-displacement lexaddr))))
