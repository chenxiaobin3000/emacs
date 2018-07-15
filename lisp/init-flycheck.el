;;; init-flycheck.el --- flycheck mode
;;; Commentary:

;;; Code:
(require-package 'flycheck)

(add-hook 'after-init-hook 'global-flycheck-mode)

(provide 'init-flycheck)
;;; init-flycheck.el ends here
