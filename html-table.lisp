;;;; html-table.lisp

(in-package #:html-table)

;;; "html-table" goes here. Hacks and glory await!

(defun type_tr(a &optional (out nil))
  (cond
    ((and (numberp a ) (< a 10))
     (format out "<td>~6,4F</td>" a))
    ((and (numberp a ) (< a 100))
     (format out "<td>~6,2F</td>" a))
    ((and (numberp a ) (< a 1000))
     (format out "<td>~6,1F</td>" a))
    ((and (numberp a ) (<= 1000 a))
     (format out "<td>~6,0F</td>" a))
    (T
     (format out "<td>~A</td>" a))))

(defun list-list-html-table(l f_name)
  "
(list-list-html-table '((1 2 3)(2 3 4) (5 6 7)) #p\"D:/home/_namatv/tmp/123.html\") "
  (with-open-file (out f_name :direction :output :if-exists :supersede)
    (list-html l out)))

(defun list-html (l &optional (out t) &key (charset "utf8"))
  (format out "<html>
<head>
<META HTTP-EQUIV=\"CONTENT-TYPE\" CONTENT=\"text/html; charset=~A\">
</head>" charset)
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
