;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Table definition
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

;; Use hash tables for the underlying table representation.
;; Section 3.3.3 will introduce make-table and show get & put
;; implemented in those terms.

(define op-table (make-hash-table))

;; Defined with default return value so we don't get
;; "Unspecified return value" on every call to (get).

(define (put op types val)
  (hash-table-set! op-table (list op types) val))

(define (get op types)
  (hash-table-ref/default op-table (list op types) #f))

;; 1 ]=> (put 'add '(k1 k2) 42)
;; Unspecified return value

;; 1 ]=> (get 'add '(k1 k2))
;; Value: 42

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;; Table ops
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;

(define (attach-tag type-tag contents)
  (cons type-tag contents))

(define (type-tag datum)
  (if (pair? datum)
    (car datum)
    (error "bad tagged data -- TYPE-TAG" datum)))

(define (content datum)
  (if (pair? datum)
    (cdr datum)
    (error "bad tagged data -- CONTENTS" datum)))

(define (apply-generic op . args)
  (let ((type-tags (map type-tag args)))
    (let ((proc (get op type-tags)))
      (if proc
          (apply proc (map content args))
          (error
           "No method for these types - APPLY-GENERIC"
           (list op type-tags))))))
