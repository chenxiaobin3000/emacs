;;; init-cscope.el --- cscope mode
;;; Commentary:

;;; Code:

;; myhelp-cscope
(defun myhelp-cscope ()
  "Show cscope key map help."
  (interactive)
  (help-few-windows "
########################################
C-. s	 cscope-find-this-symbol
C-. g	 cscope-find-global-definition
C-. G	 cscope-find-global-definition-no-prompting
C-. c	 cscope-find-functions-calling-this-function
C-. C	 cscope-find-called-functions
C-. t	 cscope-find-this-text-string
C-. e	 cscope-find-egrep-pattern
C-. f	 cscope-find-this-file
C-. i	 cscope-find-files-including-file

C-. b	 cscope-display-buffer
C-. B	 cscope-display-buffer-toggle
C-. u	 cscope-pop-mark

C-. a	 cscope-set-initial-directory
C-. A	 visit-tags-table
########################################"))

(require-package 'xcscope)
(cscope-setup)
(setq cscope-do-not-update-database t)

(provide 'init-cscope)
;;; init-cscope.el ends here
