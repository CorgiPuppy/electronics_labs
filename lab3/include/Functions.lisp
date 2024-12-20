(defun fill-array (physical-value array-name-1 begin-index end-index array-name-2 array-name-3 value-name step-value)
	"Fill a physical array."
	(loop for i from begin-index to end-index and value from value-name by step-value do
		(cond
			((string-equal physical-value "C_p") (setf (aref array-name-1 i) value))
			((or (string-equal physical-value "R")
				(string-equal physical-value "X_L")
				(string-equal physical-value "X_C")) 
			 (setf (aref array-name-1 i) (/ (aref array-name-2 i) (aref array-name-3 i))))
			((string-equal physical-value "Z") (setf (aref array-name-1 i) (/ U (aref array-name-2 i))))
			((or (string-equal physical-value "X")
				 (string-equal physical-value "B")) 
			 (setf (aref array-name-1 i) (- (aref array-name-2 i) (aref array-name-3 i))))
			((string-equal physical-value "phi") (setf (aref array-name-1 i) (atan (/ (aref array-name-2 i) (aref array-name-3 i)))))
			((string-equal physical-value "S") (setf (aref array-name-1 i) (* (aref array-name-2 i) U)))
			((string-equal physical-value "Q") (setf (aref array-name-1 i) (* (sqrt (aref array-name-2 i)) (aref array-name-3 i))))
			((or (string-equal physical-value "Y")
				 (string-equal physical-value "G")
				 (string-equal physical-value "B_L")
				 (string-equal physical-value "B_C")) 
			 (setf (aref array-name-1 i) (/ (aref array-name-2 i) U)))
			((string-equal physical-value "cos_phi") (setf (aref array-name-1 i) (/ (aref array-name-2 i) (aref array-name-3 i)))))))

(defun write-to-file (file-name physical-value array-name-1 array-name-2 begin-index end-index)
	(with-open-file (str file-name
					 :direction :output
					 :if-exists :supersede
					 :if-does-not-exist :create)
		(loop for i from begin-index to end-index do
			(if (string-equal physical-value "U")
				(format str "~d ~d ~%" (aref array-name-1 i) U)
				(format str "~d ~,4f ~%" (aref array-name-1 i) (aref array-name-2 i))))))
