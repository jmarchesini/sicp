1 ]=> (define x (list 1 2 3))

;Value: x

1 ]=> (define y (list 4 5 6))

;Value: y

1 ]=> (append x y)

;Value: (1 2 3 4 5 6)

1 ]=> (cons x y)

;Value: ((1 2 3) 4 5 6)

1 ]=> (list x y)

;Value: ((1 2 3) (4 5 6))
