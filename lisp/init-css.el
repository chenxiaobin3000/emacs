;;; init-css.el --- css mode
;;; Commentary:

;;; Code:
(require-package 'sass-mode)
(require-package 'scss-mode)
(setq-default scss-compile-at-save nil)

(provide 'init-css)
;;; init-css.el ends here
