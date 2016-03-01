(defun create-array (n str)
  (let ((arr (make-array n :fill-pointer 0)))
    (dolist (i (split-sequence:SPLIT-SEQUENCE #\Space str))
      (vector-push (parse-integer i) arr))
    arr))

(defun bread ()
  (with-open-file (in "bins.txt")
    (let ((n-arr (parse-integer (read-line in)))
          (n-probes (parse-integer (read-line in))))
      (list (create-array n-arr (read-line in))
            (create-array n-probes (read-line in))))))

(defun bsearch (n lst &key (offset 0))
  (let ((l (length lst)))
    (if (= l 0) -1
        (if (= l 1)
            (if (= n (elt lst 0)) (+ offset 1) -1)
            (let* ((i (floor (/ l 2)))
                   (el (elt lst i)))
              (cond
                ((= n el) (+ offset i 1))
                ((< n el) (bsearch n (subseq lst 0 i) :offset offset))
                (t (bsearch n (subseq lst (+ i 1)) :offset (+ i 1 offset)))))))))

(defun main ()
  (let ((data (bread)))
    (with-open-file (out "bins_result.txt"
                         :direction :output
                         :if-exists :supersede)
      (loop for i across (elt data 1)
         do (format out "~a " (bsearch i (elt data 0)))))))
