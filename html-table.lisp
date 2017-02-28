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

(defun list-list-html-table(l f_name)
  "
(list-list-html-table '((1 2 3)(2 3 4) (5 6 7)) #p\"D:/home/_namatv/tmp/123.html\") "
  (with-open-file (out f_name :direction :output :if-exists :supersede)
    (list-html l :out out)))

(defun list-html (l &key (out t) (charset "utf8") (header nil))
  (format out "<html>
<head>
<meta charset=\"~A\">
</head>~%" charset)
  (when header (format out "<h1>~A</h1>~%" header))
  (format out "<table>~%")
  (mapcar
   #'(lambda(l1)
       (format out "<tr>")
       (mapcar #'(lambda(el) (type_tr el out)) l1)
       (format out "</tr>~%"))
   l)
  (format out "</table>~%</html>~%"))

;;(list-html '((1 2 3)(2 3 4) (5 6 7)))
;;(list-list-html-table '((1 2 3)(2 3 4) (5 6 7)) #p"D:/home/_namatv/tmp/123.html")
