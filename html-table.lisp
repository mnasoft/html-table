;;;; html-table.lisp

(in-package #:html-table)

;;; "html-table" goes here. Hacks and glory await!

(defun round-val (a &optional (out nil))
  (cond
    ((and (numberp a ) (= a 0))            (format out "~A" (string-trim " " (format nil "~4,2F" a))))
    ((and (numberp a ) (< (abs a) 0.01))   (format out "~A" (string-trim " " (format nil "~6,3E" a))))
    ((and (numberp a ) (< (abs a) 0.1))    (format out "~A" (string-trim " " (format nil "~7,5F" a))))
    ((and (numberp a ) (< (abs a) 1))      (format out "~A" (string-trim " " (format nil "~7,4F" a))))
    ((and (numberp a ) (< (abs a) 10))     (format out "~A" (string-trim " " (format nil "~7,3F" a))))
    ((and (numberp a ) (< (abs a) 100))    (format out "~A" (string-trim " " (format nil "~7,2F" a))))
    ((and (numberp a ) (< (abs a) 1000))   (format out "~A" (string-trim " " (format nil "~7,1F" a))))
    ((and (numberp a ) (< (abs a) 10000))  (format out "~A" (string-trim " " (format nil "~7,0F" a))))
    ((and (numberp a ) (< (abs a) 100000)) (format out "~A" (string-trim " " (format nil "~7,0F" a))))
    ((and (numberp a ))                    (format out "~A" (string-trim " " (format nil "~6,3E" a))))
    (T                                     (format out "~A"    a))))

(defun type-tr-point (a &optional (out nil) )
  (cond
    ((and (numberp a ) (= a 0))            (format out "<td>~4,2F</td>" a))
    ((and (numberp a ) (< (abs a) 0.01))   (format out "<td>~6,3E</td>" a))
    ((and (numberp a ) (< (abs a) 0.1))    (format out "<td>~7,5F</td>" a))
    ((and (numberp a ) (< (abs a) 1))      (format out "<td>~7,4F</td>" a))
    ((and (numberp a ) (< (abs a) 10))     (format out "<td>~7,3F</td>" a))
    ((and (numberp a ) (< (abs a) 100))    (format out "<td>~7,2F</td>" a))
    ((and (numberp a ) (< (abs a) 1000))   (format out "<td>~7,1F</td>" a))
    ((and (numberp a ) (< (abs a) 10000))  (format out "<td>~d</td>" (round a)))
    ((and (numberp a ) (< (abs a) 100000)) (format out "<td>~d</td>" (round a)))
    ((and (numberp a ))                    (format out "<td>~6,3E</td>" a))
    ((and (null    a ))                    (format out "<td></td>" ))
    (T                                     (format out "<td>~A</td>"    a))))

(defun type-tr-comma (a &optional (out nil) )
  (cond
    ((and (numberp a ) (= a 0))            (format out "~a" (substitute #\, #\. (format nil "<td>~4,2F</td>" a))))
    ((and (numberp a ) (< (abs a) 0.01))   (format out "~a" (substitute #\, #\. (format nil "<td>~6,3E</td>" a))))
    ((and (numberp a ) (< (abs a) 0.1))    (format out "~a" (substitute #\, #\. (format nil "<td>~7,5F</td>" a))))
    ((and (numberp a ) (< (abs a) 1))      (format out "~a" (substitute #\, #\. (format nil "<td>~7,4F</td>" a))))
    ((and (numberp a ) (< (abs a) 10))     (format out "~a" (substitute #\, #\. (format nil "<td>~7,3F</td>" a))))
    ((and (numberp a ) (< (abs a) 100))    (format out "~a" (substitute #\, #\. (format nil "<td>~7,2F</td>" a))))
    ((and (numberp a ) (< (abs a) 1000))   (format out "~a" (substitute #\, #\. (format nil "<td>~7,1F</td>" a))))
    ((and (numberp a ) (< (abs a) 10000))  (format out "<td>~d</td>" (round a)))
    ((and (numberp a ) (< (abs a) 100000)) (format out "<td>~d</td>" (round a)))
    ((and (numberp a ))                    (format out "<td>~6,3E</td>" a))
    ((and (null    a ))                    (format out "<td></td>" ))
    (T                                     (format out "<td>~A</td>"    a))))

(defun list-list-html-table(l f_name)
  "Пример использования:
;;;; (list-list-html-table '((1 2 3)(2 3 4) (5 6 7)) #p\"D:/home/_namatv/tmp/123.html\")
 "
  (with-open-file (out f_name :direction :output :if-exists :supersede :external-format :utf8)
    (list-html l :out out)))

(defun list-html (l &key (out t) (charset "utf-8") (header nil) (point-to-comma t))
  (format out "<html>
<head>
<meta charset=\"~A\">
</head>~%" charset)
  (when header (format out "<h1>~A</h1>~%" header))
  (format out "<table>~%")
  (mapcar
   #'(lambda(l1)
       (format out "<tr>")
       (mapcar #'(lambda(el)
		   (if point-to-comma
		       (type-tr-comma el out)
		       (type-tr-point el out)))
	       l1)
       (format out "</tr>~%"))
   l)
  (format out "</table>~%</html>~%"))

;;(list-html '((1 2 3)(2 3 4) (5 6 7)))
;;(list-list-html-table '((1 2 3)(2 3 4) (5 6 7)) #p"D:/home/_namatv/tmp/123.html")

;;;; (type_tr 0.0)
