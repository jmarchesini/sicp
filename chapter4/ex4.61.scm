;; query
(?x next-to ?y in (1 (2 3) 4))

;; results
(1 next-to (2 3) in (1 (2 3) 4))
((2 3) next-to 4 in (1 (2 3) 4))
(2 next-to 3 in (1 (2 3) 4))


;; query
(?x next-to 1 in (2 1 3 1))

;; results
(2 next-to 1 in (2 1 3 1))
(3 next-to 1 in (2 1 3 1))
