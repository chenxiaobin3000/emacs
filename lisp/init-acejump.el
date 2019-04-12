;;; init-acejump.el --- acejump mode
;;; Commentary:

;;; Code:
(require-package 'ace-jump-mode)

;; 启动全局跳转模式
(autoload
  'ace-jump-mode
  "ace-jump-mode"
  "Emacs quick move minor mode"
  t)

(provide 'init-acejump)
;;; init-acejump.el ends here
