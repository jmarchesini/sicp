(define (extract-labels text receive)
   (if (null? text)
       (receive '() '())
       (extract-labels
        (cdr text)
        (lambda (insts labels)
          (let ((next-inst (car text)))
            (if (sysmbol? next-inst)
                (let ((existing (assoc next-inst labels)))
                  (if existing
                      (error "Repeated label name" next-inst)
                      (receive insts
                          (cons (make-label-entry next-inst insts)
                                labels))))
                (receive (cons (make-instruction next-inst)
                               insts)
                    labels)))))))
