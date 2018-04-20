;;; init-shell.el --- shell
;;; Commentary:

;;; Code:
(require 'comint)

;; 设置shell编码
(setenv "LANG"        "zh_CN.UTF-8")
(setenv "LC_All"      "zh_CN.UTF-8")
(setenv "LC_COLLATE"  "zh_CN.UTF-8")
(setenv "LC_CTYPE"    "zh_CN.UTF-8")
(setenv "LC_MESSAGES" "zh_CN.UTF-8")
(setenv "LC_MONETARY" "zh_CN.UTF-8")
(setenv "LC_NUMERIC"  "zh_CN.UTF-8")
(setenv "LC_TIME"     "zh_CN.UTF-8")

;; eshell的clear
(defun my-eshell-erase-buffer ()
  "My eshell erase buffer."
  (interactive)
  (let ((eshell-buffer-maximum-lines 0))
    (eshell-truncate-buffer)))
(defalias 'eshell/clear 'my-eshell-erase-buffer)

;; 历史命令
(define-key comint-mode-map (kbd "<up>") 'comint-previous-input)
(define-key comint-mode-map (kbd "<down>") 'comint-next-input)

(provide 'init-shell)
;;; init-shell.el ends here
