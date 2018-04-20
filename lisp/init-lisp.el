;;; init-lisp.el --- lisp mode
;;; Commentary:

;;; Code:
(require-package 'slime)
(require 'slime-autoloads)

(add-to-list 'auto-mode-alist '("\\.cl\\'" . lisp-mode))

(setq inferior-lisp-program "/usr/local/bin/sbcl")

;; Also setup the slime-fancy contrib
(add-to-list 'slime-contribs 'slime-fancy)

;; 绑定运行
(add-hook 'slime-mode-hook
          (lambda ()
            (define-key slime-mode-map [(f5)] (kbd "C-c C-c"))))

(provide 'init-lisp)
;;; init-lisp.el ends here
