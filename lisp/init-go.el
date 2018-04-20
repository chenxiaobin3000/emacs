;;; init-go.el --- go mode
;;; Commentary:

;;; Code:
(require-package 'go-mode)
(require 'go-mode-autoloads)

(require-package 'company-go)

;; 保存时自动gofmt
(add-hook 'before-save-hook 'gofmt-before-save)

;; 使用godef
(add-hook 'go-mode-hook
		  (lambda ()
			;; 自动补全
			(require 'company-go)
			(set (make-local-variable 'company-backends) '(company-go))

			;; 语法检查
			(add-to-list 'load-path "~/Documents/go/src/github.com/dougm/goflymake")
			(require 'go-flycheck)

			(local-set-key (kbd "M-.") 'godef-jump)
			(local-set-key (kbd "M-*") 'pop-tag-mark)))

(provide 'init-go)
;;; init-go.el ends here
