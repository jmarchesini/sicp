(define (flip-horiz painter)
  (transform-painter painter
                     (make-vert 0.0 1.0)
                     (make-vert 0.0 0.0)
                     (make-vert 1.0 1.0)))

(define (rot-180 painter)
  (transform-painter painter
                     (make-vert 1.0 1.0)
                     (make-vert 0.0 1.0)
                     (make-vert 1.0 0.0)))

(define (rot-270 painter)
  (transform-painter painter
                     (make-vert 0.0 1.0)
                     (make-vert 0.0 0.0)
                     (make-vert 1.0 1.0)))
