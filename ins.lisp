(defun read-nums (str)
  (let ((lst nil))
    (dolist (i (split-sequence:SPLIT-SEQUENCE #\Space str))
      (push (parse-integer i) lst))
    (reverse lst)))

(defun ins-sort (lst)
  (let ((s 0))
   (loop for i from 1 to (- (length lst) 1)
      with k
      do (progn
           (setf k i)
           (loop while (and (> k 0) (< (elt lst k)  (elt lst (- k 1))))
              do (progn
                   (rotatef (elt lst k) (elt lst (- k 1)))
                   (incf s)
                   (decf k)))))
   (list lst s)))

(defun main ()
  (with-open-file (in "ins.txt")
    (read-line in)
    (elt (ins-sort (read-nums (read-line in))) 1)))
