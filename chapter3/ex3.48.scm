(define (serialized-exchange acct1 acct2)
  (let ((s1 (acct1 'serializer))
        (s2 (acct2 'serializer)))
    (if (< (acct1 'id) (acct2 'id))
        ((s2 (s1 exchange)) acct1 acct2)
        ((s1 (s2 exchange)) acct1 acct2))))


(define (make-account-and-serializer id balance)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin 
          (set! balance (- balance amount))
          balance)
        "Insufficient funds"))
  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)
  (let ((balance-serializer (make-serializer)))
    (define (dispatch m)
      (cond ((eq? m 'withdraw) withdraw)
            ((eq? m 'deposit) deposit)
            ((eq? m 'balance) balance)
            ((eq? m 'serializer) balance-serializer)
            ((eq? m 'id) id)
            (else (error "Unknown request: 
                          MAKE-ACCOUNT"
                         m))))
    dispatch))
