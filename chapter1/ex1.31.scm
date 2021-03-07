;; Part a
(define (product term a next b)
   (define (iter a result)
   (if (> a b)
       result
       (iter (next a) (* (term a) result))))
   (iter a 1))

(define (identity x) x)
(define (inc x) (+ x 1))
(define (fact x)
  (product identity 1 inc x))

;; pi/2 is Wallis product from wiki page:
;;   https://en.wikipedia.org/wiki/Wallis_product
;;
;; I multiplied by 2 to get pi
(define (wallis-approx n)
  (define (term x)
    (/ (* 4.0 (square x))
       (- (* 4.0 (square x)) 1)))
  (* 2.0 (product term 1 inc n)))

;; Part b
(define (product-rec term a next b)
   (if (> a b)
     1
     (* (term a)
        (product term (next a) next b))))


;;1 ]=> (wallis-approx 10)
;Value: 3.0677038066434985

;;1 ]=> (wallis-approx 100)
;Value: 3.133787490628162

;;1 ]=> (wallis-approx 1000)
;Value: 3.140807746030402

;;1 ]=> (wallis-approx 10000)
;Value: 3.1415141186819566

;;1 ]=> (wallis-approx 100000)
;Value: 3.141584799657247

;;1 ]=> (wallis-approx 10000000)
;Value: 3.1415925750808533
