(define (good-enough-orig? guess x)
  (< (abs (- (square guess) x)) .001))

(define (sqrt-iter-orig guess x)
  (if (good-enough? guess x)
      guess
      (sqrt-iter (improve guess x)
                 x)))

(define (good-enough? previous guess)
  (< (abs (/ (- guess previous) guess)) .000000001))

(define (improve guess x)
  (average guess (/ x guess)))

(define (average x y)
  (/ (+ x y) 2))

(define (sqrt-iter guess x)
  (if (good-enough? guess (improve guess x))
      guess
      (sqrt-iter (improve guess x) x)))

(define (sqrt x)
  (sqrt-iter 1.0 x))


;; The tolerance defined in good-enough? is too large to handle small
;;   numbers well.  With values of x smaller than the tolerance, we
;;   terminate too quickly and lose precision.
;;
;; 1 ]=> (square (sqrt-iter 1.0 0.00009))
;; Value: 1.0370489120680158e-3


;; I think we're overflowing floating point numbers when things get too
;;   big.  The text mentions using 1.0 as the initial guess to force
;;   the use of floating point instead of fractions.  This never returns.
;;
;; 1 ]=> (sqrt-iter 1.0 9876987698769876987698769876)


;; With the updated version the error is very small in relation to the
;;   argument to sqrt.
