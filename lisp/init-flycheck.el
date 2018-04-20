;;; init-flycheck.el --- flycheck mode
;;; Commentary:

;;; Code:
(require-package 'flycheck)

(add-hook 'after-init-hook 'global-flycheck-mode)

(add-hook 'c++-mode-hook
		  (lambda ()
			(setq flycheck-clang-language-standard "c++11")
			(setq flycheck-clang-include-path
				  (list (expand-file-name "~/Documents/include/")))))

(provide 'init-flycheck)
;;; init-flycheck.el ends here
