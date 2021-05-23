(define (attach-tag type-tag contents)
  (if (number? contents)
      contents
      (cons type-tag contents)))

(define (type-tag datum)
  (cond ((pair? datum) (car datum))
        ((number? datum) 'scheme-number)
        (else
         "bad tagged data - TYPE-TAG")))

(define (content datum)
  (cond ((pair? datum) (cdr datum))
        ((number? datum) datum)
        (else
         "bad tagged data")))

         
