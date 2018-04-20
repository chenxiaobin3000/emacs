;;; init-company.el --- company mode
;;; Commentary:

;;; Code:
(require-package 'company)
(require 'company)

(setq company-idle-delay 0.2)
(setq company-minimum-prefix-length 2)
(setq company-tooltip-limit 20)
(setq company-dabbrev-downcase nil)
(setq company-dabbrev-other-buffers t)
(setq company-dabbrev-code-other-buffers 'all)
(setq company-dabbrev-code-everywhere t)
(setq company-dabbrev-code-ignore-case t)

(global-company-mode 1)

;; tab补全，兼容yasnippet
(defun check-expansion ()
  "Check expansion."
  (save-excursion
	(if (looking-at "\\_>") t
	  (backward-char 1)
	  (if (looking-at "\\.") t
		(backward-char 1)
		(if (looking-at "->") t nil)))))

(defun do-yas-expand ()
  "Do yas expand."
  (let ((yas/fallback-behavior 'return-nil))
	(yas/expand)))

(defun tab-indent-or-complete ()
  "Tab indent or complete."
  (interactive)
  (cond
   ((minibufferp)
    (minibuffer-complete))
   (t
    (indent-for-tab-command)
    ;; (if (or (not yas/minor-mode)
			;; (null (do-yas-expand)))
		(if (check-expansion)
			(progn
			  (company-manual-begin)
			  (if (null company-candidates)
				  (progn
					(company-abort)
					(indent-for-tab-command))))))))

(provide 'init-company)
;;; init-company.el ends here
