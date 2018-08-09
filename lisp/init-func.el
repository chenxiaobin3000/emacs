;;; init-func.el --- func
;;; Commentary:

;;; Code:

;; this macro from Purcell
(defmacro after-load (feature &rest body)
  "After FEATURE is loaded, evaluate BODY."
  (declare (indent defun))
  `(eval-after-load ,feature
	 '(progn ,@body)))

(defun projectile-create-new-project ()
  "Projectile create new project."
  (interactive)
  (shell-command "touch .projectile"))

(defun php-create-new-project ()
  "Php create new project."
  (interactive)
  (shell-command "touch .ac-php-conf.json"))

(defun smarter-move-beginning-of-line (arg)
  "Move point back to indentation of beginning of line with ARG."
  (interactive "^p")
  (setq arg (or arg 1))

  ;; Move lines first
  (when (/= arg 1)
    (let ((line-move-visual nil))
      (forward-line (1- arg))))

  (let ((orig-point (point)))
    (back-to-indentation)
    (when (= orig-point (point))
      (move-beginning-of-line 1))))

(defun my-scroll-up ()
  "Scroll up 1 line."
  (interactive)
  (scroll-up 1))

(defun my-scroll-down ()
  "Scroll down 1 line."
  (interactive)
  (scroll-down 1))

(defun my-kill-word ()
  "Kill the word at point."
  (interactive)
  (let ((bounds (bounds-of-thing-at-point 'word)))
    (if bounds (kill-region (car bounds) (cdr bounds))
      (delete-char 1))))

(defun my-find-file-other-window (filename &optional wildcards)
  "Find file other window with FILENAME OPTIONAL WILDCARDS."
  (interactive
   (find-file-read-args "Find file in other window: "
                        (confirm-nonexistent-file-or-buffer)))
  (let ((value (find-file-noselect filename nil nil wildcards)))
    (if (listp value)
		(progn
		  (setq value (nreverse value))
		  (switch-to-buffer-other-window (car value))
		  (mapc 'switch-to-buffer (cdr value))
		  value)
      (switch-to-buffer-other-window value)
	  (other-window -1))))

(defun my-switch-to-buffer-other-window (buffer-or-name &optional norecord)
  "Switch to buffer other window with BUFFER-OR-NAME OPTIONAL NORECORD."
  (interactive
   (list (read-buffer-to-switch "Switch to buffer in other window: ")))
  (let ((pop-up-windows t))
    (pop-to-buffer buffer-or-name t norecord))
  (other-window -1))

(defun reset-emacs()
  "Reset emacs buffer."
  (interactive)
  (delete-other-windows)
  (mapc 'kill-buffer (buffer-list))
  ;; create a scratch buffer
  (switch-to-buffer (get-buffer-create "*scratch*"))
  (lisp-interaction-mode))

(defun insert-tab-char ()
  "Insert a tab char."
  (interactive)
  (insert "\t"))

(defun flush-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive)
  (revert-buffer t t))

(defun term-tab-complete ()
  "Tab for term."
  (interactive)
  (term-send-raw-string "\t"))

;; 自定义help布局
(defun help-few-windows (text)
  "Slit the current frame into 2 windows: source code and TEXT help."
  (interactive)
  (delete-other-windows)
  (let ((win0 (selected-window))
		(win1 (split-window-right ( / ( * (window-width) 3) 4))))
	(select-window win1)
	(switch-to-buffer "*Messages*")
	(message text)
	(message "")
	(goto-char (point-max))
	(scroll-down 10)
	(select-window win0)))

(provide 'init-func)
;;; init-func.el ends here
