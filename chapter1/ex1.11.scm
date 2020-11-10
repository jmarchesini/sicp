(define (f n)
  (if (< n 3)
      3
      (+ (f (- n 1))
         (* 2 (f (- n 2)))
         (* 3 (f (- n 3))))))

(define (g n)
  (if (< n 3)
      3
      (g-iter 3 3 3 n)))

(define (g-iter a b c count)
  (if (= count 2)
      a
      (g-iter (+ a (* 2 b) (* 3 c)) a b (- count 1))))
