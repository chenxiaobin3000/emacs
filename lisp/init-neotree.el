;;; init-neotree.el --- neotree mode
;;; Commentary:

;;; Code:
(require-package 'neotree)

(setq neo-window-position 'right)
(setq neo-theme 'ascii’)

;; 关联projectile
(setq projectile-switch-project-action 'neotree-projectile-action)

(provide 'init-neotree)
;;; init-neotree.el ends here
