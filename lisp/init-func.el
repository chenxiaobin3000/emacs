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

(defun reset-emacs()
  "Reset Emacs buffer."
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

(defun my-flush-current-buffer ()
  "Revert buffer."
  (interactive)
  (revert-buffer t t))

(defun my-current-buffer-as-root ()
  "Edit the file that is associated with the current buffer as root."
  (interactive)
  (let ((filep (buffer-file-name)))
    (if filep (find-file (concat "/sudo::" filep))
      (message "Current buffer does not have an associated file."))))

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
