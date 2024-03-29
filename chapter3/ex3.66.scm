(load "stream.scm")

(define (interleave s1 s2)
  (if (stream-null? s1)
      s2
      (cons-stream (stream-car s1)
                   (interleave s2 (stream-cdr s1)))))

(define (pairs s t)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (interleave
    (stream-map (lambda (x) (list (stream-car s) x))
                (stream-cdr t))
    (pairs (stream-cdr s) (stream-cdr t)))))


;; 1 ]=> (display-stream p)

;; (1 1)
;; (1 2)
;; (2 2)
;; (1 3)
;; (2 3)
;; (1 4)
;; (3 3)
;; (1 5)
;; (2 4)
;; (1 6)
;; (3 4)
;; (1 7)
;; (2 5)
;; (1 8)
;; (4 4)
;; (1 9)
;; (2 6)
;; (1 10)
;; (3 5)
;; (1 11)
;; (2 7)
;; (1 12)
;; (4 5)
;; (1 13)
;; (2 8)
;; (1 14)
;; (3 6)
;; (1 15)
;; (2 9)
;; (1 16)
;; (5 5)
;; (1 17)
;; (2 10)
;; (1 18)
;; (3 7)
;; (1 19)
;; (2 11)
;; (1 20)
;; (4 6)
;; (1 21)
;; (2 12)
;; (1 22)
;; (3 8)
;; (1 23)
;; (2 13)
;; (1 24)
;; (5 6)
;; (1 25)
;; (2 14)
;; (1 26)
;; (3 9)
;; (1 27)
;; (2 15)
;; (1 28)
;; (4 7)
;; (1 29)
;; (2 16)
;; (1 30)
;; (3 10)
;; (1 31)
;; (2 17)
;; (1 32)
;; (6 6)
;; (1 33)
;; (2 18)
;; (1 34)
;; (3 11)
;; (1 35)
;; (2 19)
;; (1 36)
;; (4 8)
;; (1 37)
;; (2 20)
;; (1 38)
;; (3 12)
;; (1 39)
;; (2 21)
;; (1 40)
;; (5 7)
;; (1 41)
;; (2 22)
;; (1 42)
;; (3 13)
;; (1 43)
;; (2 23)
;; (1 44)
;; (4 9)
;; (1 45)
;; (2 24)
;; (1 46)
;; (3 14)
;; (1 47)
;; (2 25)
;; (1 48)
;; (6 7)
;; (1 49)
;; (2 26)
;; (1 50)
;; (3 15)
;; (1 51)
;; (2 27)
;; (1 52)
;; (4 10)
;; (1 53)
;; (2 28)
;; (1 54)
;; (3 16)
;; (1 55)
;; (2 29)
;; (1 56)
;; (5 8)
;; (1 57)
;; (2 30)
;; (1 58)
;; (3 17)
;; (1 59)
;; (2 31)
;; (1 60)
;; (4 11)
;; (1 61)
;; (2 32)
;; (1 62)
;; (3 18)
;; (1 63)
;; (2 33)
;; (1 64)
;; (7 7)
;; (1 65)
;; (2 34)
;; (1 66)
;; (3 19)
;; (1 67)
;; (2 35)
;; (1 68)
;; (4 12)
;; (1 69)
;; (2 36)
;; (1 70)
;; (3 20)
;; (1 71)
;; (2 37)
;; (1 72)
;; (5 9)
;; (1 73)
;; (2 38)
;; (1 74)
;; (3 21)
;; (1 75)
;; (2 39)
;; (1 76)
;; (4 13)
;; (1 77)
;; (2 40)
;; (1 78)
;; (3 22)
;; (1 79)
;; (2 41)
;; (1 80)
;; (6 8)
;; (1 81)
;; (2 42)
;; (1 82)
;; (3 23)
;; (1 83)
;; (2 43)
;; (1 84)
;; (4 14)
;; (1 85)
;; (2 44)
;; (1 86)
;; (3 24)
;; (1 87)
;; (2 45)
;; (1 88)
;; (5 10)
;; (1 89)
;; (2 46)
;; (1 90)
;; (3 25)
;; (1 91)
;; (2 47)
;; (1 92)
;; (4 15)
;; (1 93)
;; (2 48)
;; (1 94)
;; (3 26)
;; (1 95)
;; (2 49)
;; (1 96)
;; (7 8)
;; (1 97)
;; (2 50)
;; (1 98)
;; (3 27)
;; (1 99)
;; (2 51)
;; (1 100)

