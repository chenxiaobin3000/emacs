;;; init-yasnippet.el --- yasnippet mode
;;; Commentary:

;;; Code:
(require-package 'yasnippet)

(yas-global-mode 1)

;; 移除默认tab绑定
(define-key yas-minor-mode-map (kbd "<tab>") nil)
(define-key yas-minor-mode-map (kbd "TAB") nil)

;; 设置 shitf + tab 为 yas-expand
(define-key yas-minor-mode-map (kbd "<backtab>") 'yas-expand)

(provide 'init-yasnippet)
;;; init-yasnippet.el ends here
