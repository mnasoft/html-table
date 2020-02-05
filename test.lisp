;;;; html-table.lisp

(in-package #:html-table)

;;; "html-table" goes here. Hacks and glory await!

(defun type_tr(a &optional (out nil))
  (cond
    ((and (numberp a ) (< a 0.01))   (format out "<td>~6,3E</td>" a))
    ((and (numberp a ) (< a 0.1))    (format out "<td>~7,5F</td>" a))
    ((and (numberp a ) (< a 1))      (format out "<td>~7,4F</td>" a))
    ((and (numberp a ) (< a 10))     (format out "<td>~7,3F</td>" a))
    ((and (numberp a ) (< a 100))    (format out "<td>~7,2F</td>" a))
    ((and (numberp a ) (< a 1000))   (format out "<td>~7,1F</td>" a))
    ((and (numberp a ) (< a 10000))  (format out "<td>~7,0F</td>" a))
    ((and (numberp a ) (< a 100000)) (format out "<td>~7,0F</td>" a))
    ((and (numberp a )) (format out "<td>~6,3E</td>" a))
    (T (format out "<td>~A</td>" a))))

;;(list-html '((1 2 3)(2 3 4) (5 6 7)))
;;(list-list-html-table '((1 2 3)(2 3 4) (5 6 7)) #p"D:/home/_namatv/tmp/123.html")

(type_tr 0.0000123456789)
(type_tr 0.000123456789)
(type_tr 0.00123456789)
(type_tr 0.0123456789)
(type_tr 0.123456789)
(type_tr 1.23456789)
(type_tr 12.3456789)
(type_tr 123.456789)
(type_tr 1234.56789)
(type_tr 12345.6789)
(type_tr 123456.789)
(type_tr 1234567.89)
(type_tr 12345678.9)

