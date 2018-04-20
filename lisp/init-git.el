;;; init-git.el --- git mode
;;; Commentary:

;;; Code:

;; myhelp-git
(defun myhelp-git ()
  "Show git key map help."
  (interactive)
  (help-few-windows "
########################################
c c			提交
g/G			刷新，全部刷新
s/S			添加当前更改，添加全部更改
u/U			撤销当前更改，撤销全部更改
k/X			删除当前更改，删除全部更改
k			checkout，回滚单文件
m m			merge
tab			查看差异（简单）
d			查看差异（复杂）
e			ediff查看差异
l			历史记录
P u			push
F u			pull
C-c 1/2/3/4	切换显示级别
########################################"))

(require-package 'magit)
(require-package 'git-timemachine)

;; 自动全屏
(require-package 'fullframe)
(after-load 'magit
  (fullframe magit-status magit-mode-quit-window)
  (define-key magit-mode-map (kbd "<tab>") 'magit-section-toggle)
  (define-key magit-mode-map (kbd "C-c 1") 'magit-section-show-level-1-all)
  (define-key magit-mode-map (kbd "C-c 2") 'magit-section-show-level-2-all)
  (define-key magit-mode-map (kbd "C-c 3") 'magit-section-show-level-3-all)
  (define-key magit-mode-map (kbd "C-c 4") 'magit-section-show-level-4-all))

(require-package 'git-gutter)
(global-git-gutter-mode t)

(provide 'init-git)
;;; init-git.el ends here
