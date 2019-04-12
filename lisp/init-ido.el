;;; init-ido.el --- ido mode
;;; Commentary:

4;;; Code:
(require 'ido)
(require-package 'idomenu)
(ido-mode t)
(ido-everywhere t)

(add-hook
 'ido-setup-hook
 (lambda ()
   (define-key ido-completion-map (kbd "<up>") 'previous-history-element)
   (define-key ido-completion-map (kbd "<tab>") 'ido-exit-minibuffer)))

;; 忽略文件
(add-to-list 'ido-ignore-files "\\.DS_Store")
(add-to-list 'ido-ignore-files "\\.meta")

;; 忽略目录
(add-to-list 'ido-ignore-directories "\\.git/")
(add-to-list 'ido-ignore-directories "\\.idea/")
(add-to-list 'ido-ignore-directories "\\.svn/")
(add-to-list 'ido-ignore-directories "\\.vscode/")

;; 忽略buffer
(add-to-list 'ido-ignore-buffers "\\`\\*.*\\*")

(provide 'init-ido)
;;; init-ido.el ends here
