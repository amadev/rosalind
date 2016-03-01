(defun read-nums (str)
  (let ((lst nil))
    (dolist (i (split-sequence:SPLIT-SEQUENCE #\Space str))
      (push (parse-integer i) lst))
    (reverse lst)))

(defun count-degree (lst)
  (let ((ht (make-hash-table))
        (lst (rest lst)))
    (loop for i in lst
       do (progn
            (or (gethash (elt i 0) ht nil) (setf (gethash (elt i 0) ht) 0))
            (or (gethash (elt i 1) ht nil) (setf (gethash (elt i 1) ht) 0))
            (incf (gethash (elt i 0) ht))
            (incf (gethash (elt i 1) ht))))
    (let ((alist nil))
      (maphash (lambda (k v)
                 (push (cons k v) alist))
               ht)
      (sort alist #'< :key #'car))))

(defun read-file-nums ()
  (with-open-file (in "deg.txt")
    (loop for line = (read-line in nil)
       while line
       collect (read-nums line))))

(defun main ()
  (loop for i in (count-degree (read-file-nums))
       do (format t "~a " (cdr i))))
