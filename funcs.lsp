(defun removenth (n l)
  (if (and l (< 0 n))
      (cons (car l) (removenth (1- n) (cdr l)))
      (cdr l)))

(defun insertnth (x n l)
  (cond
   ((null l) nil)
   ((< 0 n) (cons (car l) (insertnth x (1- n) (cdr l))))
   ((cons x l))))
