;; Original implementation from last section
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) 
         (if (same-variable? exp var)
             1
             0))
        ((sum? exp)
         (make-sum (deriv (addend exp) var)
                   (deriv (augend exp) var)))
        ((product? exp)
         (make-sum
          (make-product (multiplier exp)
                        (deriv (multiplicand exp) var))
          (make-product (deriv (multiplier exp) var)
                        (multiplicand exp))))
        ;; ⟨more rules can be added here⟩
        (else
         (error "unknown expression type: DERIV" exp))))


;; Rewrite to data-directed style
(define (deriv exp var)
  (cond ((number? exp) 0)
        ((variable? exp) 
         (if (same-variable? exp var) 
             1 
             0))
        (else ((get 'deriv (operator exp)) 
               (operands exp) 
               var))))

(define (operator exp) (car exp))

(define (operands exp) (cdr exp))


;; b) sum and product with registration



(define install-sum-deriv
  (define (addend operands) (car operands))
  (define (augend operands) (cdr operands))
  (define (make-sum a1 a2)
    (cond ((=number? a1 0) a2)
          ((=number? a2 0) a1)
          ((and (number? a1) (number? a2)) (+ a1 a2))
          (else (list '+ a1 a2))))
  (define (derive-sum operands var)
    (make-sum (deriv (addend operands) var)
              (deriv (augend operands) var)))
  (put '+ 'deriv derive-sum))

(define install-product-deriv
  (define (multiplier operands) (car operands))
  (define (multiplicand operands) (cdr operands))
  (define (make-product m1 m2)
    (cond ((or (=number? m1 0) (=number? m2 0)) 0)
          ((=number? m1 1) m2)
          ((=number? m2 1) m1)
          ((and (number? m1) (number? m2)) (* m1 m2))
          (else (list '* m1 m2))))
  (define (derive-product operands var)
    (make-sum
     (make-product (multiplier operands)
                   (deriv (multiplicand operands) var))
     (make-product (deriv (multiplier operands) var)
                   (multiplicand operands))))
  (put '* 'deriv derive-product))


;; c) Add exponentiation
(define install-exp-derivation
  (define (power operands) (cadr operands))
  (define (base operands) (car operands))
  (define (make-exponentiation base exponent)
    (cond ((=number? exponent 0) 1)
          ((=number? exponent 1) base)
          ((and (number? base) (number? exponent)) (expt base exponent))
          (else (list '** base exponent))))
  (define (derive-exponentiation operands var)
    (make-product
     (make-product (power operands)
                   (make-exponentiation (base operands)
                                        (- (power operands) 1)))
     (deriv (base operands) var)))
  (put '** 'deriv derive-exponent))

;; d) The order of quotes in the put call would need to be swapped
