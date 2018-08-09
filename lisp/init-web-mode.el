;;; init-web-mode.el --- web mode
;;; Commentary:

;;; Code:
(require-package 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.vue\\'" . web-mode))

;; 缩进
(add-hook 'web-mode-hook
		  (lambda ()
			(setq web-mode-markup-indent-offset 2)
			(setq web-mode-code-indent-offset 2)
			(setq web-mode-css-indent-offset 2)
			(setq indent-tabs-mode nil)))

;; emmet
(require-package 'emmet-mode)
(add-hook 'html-mode-hook 'emmet-mode)
(add-hook 'web-mode-hook 'emmet-mode)

(provide 'init-web-mode)
;;; init-web-mode.el ends here
