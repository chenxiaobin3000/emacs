;;; init-lua.el --- lua mode
;;; Commentary:

;;; Code:
(require-package 'lua-mode)

(add-to-list 'interpreter-mode-alist '("lua" . lua-mode))

(setq-default lua-indent-level 2)

(provide 'init-lua)
;;; init-lua.el ends here
