#lang scheme

;;exercise 1.31
(define leaf
  (lambda (x)
    x))

(define interior-node
  (lambda (node leaf1 leaf2)
    (list node leaf1 leaf2)))

(define (lson bintree)
  (cadr bintree))

(define (rson bintree)
  (caddr bintree))

(define (contents-of node)
  (if (list? node)
      (car node)
      node))

;;determine whether a bintree is a leaf
;; i.e. is a number or not
(define leaf?
  (lambda (bintree)
    (number? bintree)))


;;building tree test
(interior-node 'bar
               (leaf 26)
               (leaf 12))

(lson '(bar (bar 1 3) (bar 1 4)))
(rson '(bar (bar 1 3) (bar 1 4)))

(eqv? '(1) '(1)) ;;#f
;; in our example, compare two list to be equal or not, using equal?.
(equal? '(1) '(1)) ;;#t
;;reference: the difference between = eq? eqv? equal?, refer to 
;;http://stackoverflow.com/questions/16299246/what-is-the-difference-between-eq-eqv-equal-and-in-scheme
;;(eqv? 2 2)

;; exercise 1.32
(define (double-tree bintree)
  (if (number? bintree)
      (* 2 bintree)
      (list (contents-of bintree)
            (double-tree (lson bintree))
            (double-tree (rson bintree)))))

(double-tree '(bar (bar 1 3) (bar 1 4)))

;;ex1.33
(define (mark-leaves-with-red-depth bintree)
  (mark-iter bintree 0))

(define (mark-iter bintree count)
  (if (leaf? bintree)
      count
      (if (eqv? (contents-of bintree) 'red)
          (list 'red
                (mark-iter (lson bintree) (+ 1 count))
                (mark-iter (rson bintree) (+ 1 count)))
          (list (contents-of bintree)
                (mark-iter (lson bintree) count)
                (mark-iter (rson bintree) count)))))

;;test mark-leaves-with-red-depth
(mark-leaves-with-red-depth
 (interior-node 'red
                (interior-node 'bar
                               (leaf 26)
                               (leaf 12))
                (interior-node 'red
                               (leaf 11)
                               (interior-node 'quux
                                              (leaf 117)
                                              (leaf 14)))))
