;;; init-svn.el --- svn mode
;;; Commentary:

;;; Code:

;; myhelp-svn
(defun myhelp-svn ()
  "Show svn key map help."
  (interactive)
  (help-few-windows "
########################################
c			提交
r			回滚
U			更新
l			查看历史提交
?			切换显示／隐藏为受控文件
_			切换显示／隐藏未修改文件
b			查看blame
l			显示日志
L			显示全局日志
E			ediff查看差异
* !			取消所有标志
X X			开始解决冲突
X v			已解决冲突
########################################"))

;(require-package 'psvn)
(require 'psvn)

(setq svn-status-hide-externals t) ;; 目录方式显示
(setq svn-status-hide-unmodified t) ;; 隐藏未修改文件
(setq svn-status-hide-unknown t) ;; 隐藏未受控文件

(add-hook
 'svn-status-mode-hook
 (lambda ()
   ;; 显示全局日志
   (define-key svn-status-mode-map (kbd "L")
	 'my-svn-status-show-svn-log)))

;; 显示全局日志
(defun my-svn-status-show-svn-log ()
  "My svn status show svn log."
  (interactive)
  (svn-run t t 'log "log" (svn-status-base-info->url) "-v"))

(provide 'init-svn)
;;; init-svn.el ends here
