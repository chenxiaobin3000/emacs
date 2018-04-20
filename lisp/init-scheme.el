;;; init-scheme.el --- scheme mode
;;; Commentary:

;;; Code:
(require-package 'geiser)

(setq geiser-active-implementations '(guile))

;; 绑定运行
(add-hook 'geiser-mode-hook (lambda ()
							(define-key geiser-mode-map [(f5)] (kbd "C-c C-b"))))

(provide 'init-scheme)
;;; init-scheme.el ends here
