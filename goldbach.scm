#!/home/ijarvis12/.guix-profile/bin/guile -s
!#

;; check if n is prime
(define x 2)
(define (check n x) (if (= 0 (modulo n x)) #t #f ) )
(define (isNotPrime n x) (while (<= x (sqrt n)) (if (check n x)
                                                        (break #t)
                                                        (set! x (+ x 1))
                                                        )
                        )
)

;; starting goldbach number, and addition numbers, and flag
(define g 8)
(define a 8)
(define b 2)


;; check for an g of goldbach, in all additions to get g, there is a prime pair
(while '(#t) (set! g (+ g 2))
                (set! a (- g 2))
                (set! b 2)
                (if '(  (while (< b a) (if (and (isNotPrime a 2) (isNotPrime b 2) )
                                        (continue)
                                        (break #t)
                                        )
                                        (set! a (- a 1))
                                        (set! b (+ b 1))
                        )
                    )
                    (continue)
                    (break)
                )
)

;; display goldbach number, if there is one
(display (number->string g))
(newline)
