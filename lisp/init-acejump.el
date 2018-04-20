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

;; 启动跳回模式
(autoload
  'ace-jump-mode-pop-mark
  "ace-jump-mode"
  "Ace jump back"
  t)
(eval-after-load "ace-jump-mode"
  '(ace-jump-mode-enable-mark-sync))

(provide 'init-acejump)
;;; init-acejump.el ends here
