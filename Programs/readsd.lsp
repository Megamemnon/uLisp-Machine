(defun read-file-sd (filename)
  (with-sd-card (str filename)
    (let ((l "") (d  '()))
      (loop
        (setq l (read-line str))
          (unless l (return d))
          (setq d (reverse (cons l (reverse d))))))))
