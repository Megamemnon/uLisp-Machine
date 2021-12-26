(defun edlinsd (filename)
  (let ((document (read-file-sd filename)))
    (setq document (edlin document))
    (write-file-sd filename document)))