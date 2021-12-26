;;Line editor for LISP REPL

(defun edlin (&optional textlines)
  (cond ((not (listp textlines))
        (setq textlines (list "")))
  )
  (let ((currline "")
        (currlineno (length textlines))
        (lexresults (list #\a #\b 0))
        (action #\a))
    (loop
          (format t "~a>" currlineno)
          (setq currline (read-line))
          (setq lexresults (read-from-string currline))
          (cond
           ((listp lexresults)
            (setq action (car lexresults))
            (cond
             ((numberp (cadr lexresults))
              (setq currlineno (cadr lexresults)))
             (t
              (setq currlineno (length textlines))))
            (cond
             ((eq action 'e)
              (format t "~a|~a~%" currlineno (nth currlineno textlines)))
             ((eq action 'd)
              (setq textlines (removenth currlineno textlines))
              (setq currlineno (length textlines)))
             ((eq action 'i)
              (setq textlines (insertnth '"" currlineno textlines)))
             ((eq action 'k)
              (cond
               ((numberp (cadr lexresults))
                (setq currlineno (cadr lexresults)))
               (t
                (setq currlineno 0)))
              (dotimes (i 5)
                       (format t "~a|~a~%" currlineno (nth currlineno textlines))
                       (incf currlineno)))
             ((eq action 'l)
              (setq currlineno 0)
              (dolist (aline textlines)
                      (format t "~a|~a~%" currlineno aline)
                      (incf currlineno)))
             ((eq action 'x)
              (return textlines))))
           (t
            (cond
             ((< currlineno (length textlines))
              (setf (nth currlineno textlines) currline)
              (setq currlineno (length textlines)))
             ((>= currlineno (length textlines))
              (setq textlines (reverse textlines))
              (setq textlines (reverse (push currline textlines)))
              (setq currlineno (length textlines)))))))))
