(defun write-file-sd (filename listofstrings)
  (with-sd-card (str filename 2)
    (dolist (aline listofstrings)
      (write-line aline str))))