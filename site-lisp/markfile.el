;;; markfile.el --- markfile
;;; Commentary:

;;; Code:
(defgroup markfile nil
  "Group for `markfile'."
  :group 'tools)

(defcustom markfile-width 30
  "The name of `markfile' width."
  :group 'markfile
  :type 'integer)

(defcustom markfile-file
  (expand-file-name "markfile.data" user-emacs-directory)
  "The name of `markfile' file."
  :group 'markfile
  :type 'string)

(defvar markfile-data nil
  "`Markfile' data.")

(defun markfile-find-file ()
  "`Markfile' find file."
  (interactive)
  (ivy-read
   "markfile find file: "
   (markfile-find-file-candidates)
   :action 'markfile-find-file-action
   :sort nil))

(defun markfile-add (name)
  "`Markfile' add with NAME."
  (interactive "splease input name:")
  (unless markfile-data
	(setq markfile-data (make-hash-table :test 'equal)))
  (if (gethash name markfile-data)
	  (user-error "%s has exist" name)
	(progn
	  (puthash name (buffer-file-name) markfile-data)
	  (let ((tmp '()))
		(maphash (lambda (k v) (push (cons k v) tmp)) markfile-data)
		(setq tmp (sort tmp (lambda (a b) (string> (car a) (car b)))))
		(clrhash markfile-data)
		(dolist (o tmp)
		  (puthash (car o) (cdr o) markfile-data))
		(markfile-serialize markfile-data markfile-file)))))

(defun markfile-del ()
  "`Markfile' del."
  (interactive)
  (unless markfile-data
	(setq markfile-data (make-hash-table :test 'equal)))
  (ivy-read
   "markfile del: "
   (markfile-del-candidates)
   :action 'markfile-del-action
   :sort nil))

(defun markfile-reload ()
  "`Markfile' reload from disk."
  (interactive)
  (markfile-load-data))

(defun markfile-reset ()
  "`Markfile' reset to disk."
  (interactive)
  (unless markfile-data
	(setq markfile-data (make-hash-table :test 'equal)))
  (clrhash markfile-data)
  (markfile-serialize markfile-data markfile-file))

(defun markfile-create-title (k v)
  "`Markfile' create title with K, V."
  (let ((len (length k)))
	(concat (format (format "%%s%%%ds" (- markfile-width len)) k "|") v)))

(defun markfile-find-file-candidates (&optional numbers-width)
  "`Markfile' find file candidates with NUMBERS-WIDTH."
  (let ((tmp '()))
	(maphash
	 (lambda (k v)
	   (let ((title (markfile-create-title k v)))
		   (push (cons title v) tmp)))
	 markfile-data)
 	tmp))

(defun markfile-find-file-action (x)
  "`Markfile' find file action with X."
  (let ((file (cdr x)))
	(find-file file)))

(defun markfile-del-candidates (&optional numbers-width)
  "`Markfile' del candidates with NUMBERS-WIDTH."
  (let ((tmp '()))
	(maphash
	 (lambda (k v)
	   (let ((title (markfile-create-title k v)))
		   (push (cons title k) tmp)))
	 markfile-data)
	tmp))

(defun markfile-del-action (x)
  "`Markfile' del action with X."
  (let ((name (cdr x)))
	(remhash name markfile-data)
	(markfile-serialize markfile-data markfile-file)))

(defun markfile-load-data ()
  "`Markfile' load data."
  (setq markfile-data
		(markfile-unserialize markfile-file)))

(defun markfile-serialize (data filename)
  "`Markfile' serialize DATA to FILENAME."
  (when (file-writable-p filename)
    (with-temp-file filename
      (insert (let (print-length) (prin1-to-string data))))))

(defun markfile-unserialize (filename)
  "`Markfile' read DATA from FILENAME."
  (with-demoted-errors
      "Error during file deserialization: %S"
    (when (file-exists-p filename)
      (with-temp-buffer
        (insert-file-contents filename)
        (read (buffer-string))))))

(markfile-load-data)

(provide 'markfile)
;;; markfile.el ends here
