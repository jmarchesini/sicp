(define (multiple-dwelling) 
  (define (flat-map proc lst) 
    (if (null? lst) 
        '() 
        (let ((first (proc (car lst)))) 
          ((if (pair? first) append cons) 
           first 
           (flat-map proc (cdr lst)))))) 
  
  (define (permutations lst) 
    (if (null? lst) 
        (list '()) 
        (flat-map 
         (lambda (first) 
           (map 
            (lambda (rest) (cons first rest)) 
            (permutations (filter (lambda (x) (not (= x first))) lst)))) 
         lst))) 

  (for-each 
   (lambda (try) 
     (apply 
      (lambda (baker cooper fletcher miller smith) 
        (if (and (not (= baker 5))
                 (not (= cooper 1))
                 (not (= fletcher 1))
                 (not (= fletcher 5))
                 (> miller cooper) 
                 (not (= (abs (- smith fletcher)) 1))
                 (not (= (abs (- fletcher cooper)) 1)))
            (display (list baker cooper fletcher miller smith)))) 
      try))
   (permutations '(1 2 3 4 5)))) 

