(load "assembler.scm")

(define (make-machine register-names ops controller-text)
  (let ((machine (make-new-machine)))
    (for-each (lambda (register-name)
                ((machine 'allocate-register) register-name))
              register-names)
    ((machine 'install-operations) ops)
    ((machine 'install-instruction-sequence) (assemble controller-text machine))
    machine))

(define (make-register name)
  (let ((contents '*unassigned*)
        (trace false))
    (define (dispatch message)
      (cond ((eq? message 'get) contents)
            ((eq? message 'set)
             (lambda (value)
               (if trace
                   (begin (display "reg: ")(display name)(display " ")
                          (display "old: ")(display contents)(display " ")
                          (display "new: ")(display value)(newline)))
               (set! contents value)))
            ((eq? message 'trace-on) (set! trace true))
            ((eq? message 'trace-off) (set! trace false))
            (else
             (error "Unknown request: REGISTER" message))))
    dispatch))

(define (get-contents register)
  (register 'get))

(define (set-contents! register value)
  ((register 'set) value))

(define (make-stack)
  (let ((s '())
        (number-pushes 0)
        (max-depth 0)
        (current-depth 0))
    (define (push x)
      (set! s (cons x s))
      (set! number-pushes (+ 1 number-pushes))
      (set! current-depth (+ 1 current-depth))
      (set! max-depth (max current-depth max-depth)))
    (define (pop)
      (if (null? s)
          (error "Empty stack: POP")
          (let ((top (car s)))
            (set! s (cdr s))
            (set! current-depth (- current-depth 1))
            top)))
    (define (initialize)
      (set! s '())
      (set! number-pushes 0)
      (set! max-depth 0)
      (set! current-depth 0)
      'done)
    (define (print-statistics)
      (newline)
      (display (list 'total-pushes
                     '=
                     number-pushes
                     'maximum-depth
                     '=
                     max-depth)))
    (define (dispatch message)
      (cond ((eq? message 'push) push)
            ((eq? message 'pop) (pop))
            ((eq? message 'initialize) (initialize))
            ((eq? message 'print-statistics) (print-statistics))
            (else
             (error "Unknown request: STACK" message))))
    dispatch))

(define (pop stack)
  (stack 'pop))

(define (push stack value)
  ((stack 'push) value))

(define (make-new-machine)
  (let ((pc (make-register 'pc))
        (flag (make-register 'flag))
        (stack (make-stack))
        (the-instruction-sequence '())
        (instruction-count 0)
        (instruction-trace false))
    (let ((the-ops (list
                    (list 'initialize-stack
                          (lambda () (stack 'initialize)))
                    (list 'print-stack-statistics
                          (lambda () (stack 'print-statistics)))))
          (register-table (list
                           (list 'pc pc)
                           (list 'flag flag))))
      (define (allocate-register name)
        (if (assoc name register-table)
            (error "Multiply defined register: " name)
            (set! register-table
                  (cons (list name (make-register name))
                        register-table)))
        'register-allocated)
      (define (lookup-register name)
        (let ((val (assoc name register-table)))
          (if val
              (cadr val)
              (error "Unknown register: " name))))
      (define (execute)
        (let ((insts (get-contents pc)))
          (if (null? insts)
              'done
              (begin
                (if instruction-trace
                    (begin (display (caar insts))
                           (newline)))
                ((instruction-execution-proc (car insts)))
                (set! instruction-count (+ 1 instruction-count))
                (execute)))))
      (define (print-instruction-count)
         (newline)
         (display (list 'instruction-count
                        '=
                        instruction-count))
         (set! instruction-count 0))
      (define (dispatch message)
        (cond ((eq? message 'start)
               (set-contents! pc the-instruction-sequence)
               (execute))
              ((eq? message 'install-instruction-sequence)
               (lambda (seq) (set! the-instruction-sequence seq)))
              ((eq? message 'allocate-register) allocate-register)
              ((eq? message 'get-register) lookup-register)
              ((eq? message 'install-operations)
               (lambda (ops) (set! the-ops (append the-ops ops))))
              ((eq? message 'stack) stack)
              ((eq? message 'operations) the-ops)
              ((eq? message 'print-instruction-count) (print-instruction-count))
              ((eq? message 'trace-on) (set! instruction-trace true))
              ((eq? message 'trace-off) (set! instruction-trace false))
              (else
               (error "Unknown request: MACHINE" message))))
      dispatch)))
               
(define (start machine)
  (machine 'start))

(define (get-register-contents machine register-name)
  (get-contents (get-register machine register-name)))

(define (set-register-contents! machine register-name value)
  (set-contents! (get-register machine register-name) value)
  'done)

(define (get-register machine reg-name)
  ((machine 'get-register) reg-name))

(define (print-stack-statistics machine)
  ((machine 'stack) 'print-statistics))

(define (print-instruction-count machine)
  (machine 'print-instruction-count))

(define (instruction-trace-on machine)
  (machine 'trace-on))

(define (instruction-trace-off machine)
  (machine 'trace-off))

(define (register-trace-on machine reg-name)
  ((get-register machine reg-name) 'trace-on))

(define (register-trace-off machine reg-name)
  ((get-register machine reg-name) 'trace-off))
