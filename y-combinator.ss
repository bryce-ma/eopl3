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


;; from "why of Y?" -----------------------------------------
(let ((f (lambda (q) (lambda (n) (if (< n 2) 1 (* n (q (- n 1))))))))
  (let ((g (lambda (h) (lambda (n) ((f (h h)) n)))))
    ((g g) 10)))

(define Y (lambda (f)
            (let ((g (lambda (h)
                       (lambda (x) ((f (h h)) x)))))
              (g g))))

((Y (lambda (q) (lambda (n) (if (< n 2) 1 (* n (q (- n 1))))))) 10)

((Y (lambda (q) (lambda (n) (if (empty? n) 0 (+ 1 (q (cdr n))))))) (list 10 11))

