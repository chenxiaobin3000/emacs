;;; init-ivy.el --- ivy mode
;;; Commentary:

;;; Code:
(require-package 'smex) ;; 使用smex数据库
(require-package 'ivy)
(require-package 'counsel)
(require-package 'swiper)

(ivy-mode 1)
(setq ivy-use-virtual-buffers t)
(setq ivy-count-format "(%d/%d) ")
(setq projectile-completion-system 'ivy)
(setq ivy-height 20)

(define-key ivy-minibuffer-map (kbd "<tab>") 'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "RET") 'ivy-alt-done)
(define-key ivy-minibuffer-map (kbd "C-j") 'ivy-immediate-done)

(require 'ivy_buffer_extend)

(setq ivy-buffer-max-dir-display-length 70)

(provide 'init-ivy)
;;; init-ivy.el ends here
