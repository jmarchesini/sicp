(define (enumerate-interval low high)
  (if (> low high)
      '()
      (cons low (enumerate-interval (+ low 1) high))))

(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (ordered-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k)
                               (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (make-triple-sum triple)
  (append triple (list (accumulate + 0 triple))))

(define (ordered-triple-sum n s)
  (define (triple-sum? triple)
    (= s (accumulate + 0 triple)))
  (map make-triple-sum
       (filter triple-sum?
               (ordered-triples n))))


;; 1 ]=> (ordered-triple-sum 5 5)
;; ;Value: ()

;; 1 ]=> (ordered-triple-sum 5 7)
;; ;Value: ((4 2 1 7))

;; 1 ]=> (ordered-triple-sum 5 6)
;; ;Value: ((3 2 1 6))

;; 1 ]=> (ordered-triple-sum 5 8)
;; ;Value: ((4 3 1 8) (5 2 1 8))

;; 1 ]=> (ordered-triple-sum 5 9)
;; ;Value: ((4 3 2 9) (5 3 1 9))
