#lang scheme

;; the recursive version of factorial
(define fact
  (lambda (x)
    (if (= 0 x) 1 (* x (fact (- x 1))))))

;; later process of inventing Y combinator is inspired by Yin Wang's idea
#|
(define fact0
  ((lambda (u) (u u))
   (lambda (self)
     ((lambda (g)
        (lambda (x)
          (if (= 0 x) 1 (* x (g (- x 1)))))) (self self)))))

;; cannot terminate because of call-by-value, why?
;; call-by-value will evaluate (self self) first and this will result to itself that contains (self self), then forever loop

|#

#|
(define fact0
  ((lambda (u) (u u))
   (lambda (self)
     ((lambda (g)
        (lambda (x)
          (if (= 0 x) 1 (* x (g (- x 1))))))
      (lambda (v) ((self self) v))))))  ;; using eta-expand to prevent non-ternimation
;; the eta-expand is like this(计算模型导引[宋方敏]page.76): lambda x. Mx = M
|#

(define fact0
  ((lambda (f)                             ;; abstract to any function f             ;; the Y combinator 
     ((lambda (u) (u u))
      (lambda (self)
        (f
         (lambda (v) ((self self) v))))))
   (lambda (g)      ;; the specific function f, for this example, this is factorial   ;; apply this to Y combinator above
     (lambda (x)
       (if (= 0 x) 1 (* x (g (- x 1))))))))


;; 1*2*3*4 = 24
(fact 4)
(fact0  4)

;; using Y combinator to create even and odd function 
#|
(define even
  (lambda (x)
    (cond
     [(zero? x) #t]
     [(= 1 x) #f]
     [else (odd (sub1 x))])))
 
(define odd
  (lambda (x)
    (cond
     [(zero? x) #f]
     [(= 1 x) #t]
     [else (even (sub1 x))])))
|#
(even? 3)

(lambda (odd)      ;;;  even
  (lambda (x)
    (cond
      [(zero? x) #t]
      [(= 1 x) #f]
      [else (odd (sub1 x))])))


(lambda (even)    ;;; odd
  (lambda (x)
    (cond
      [(zero? x) #f]
      [(= 1 x) #t]
      [else (even (sub1 x))])))

