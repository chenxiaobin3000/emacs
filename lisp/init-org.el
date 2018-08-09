;;; init-org.el --- org mode
;;; Commentary:

;;; Code:

;; myhelp-org
(defun myhelp-org ()
  "Show org key map help."
  (interactive)
  (help-few-windows "
########################################
S-TAB			循环切换整个文档的大纲状态（三种状态：折叠，打开下一级，打开全部）
TAB				循环切换光标所在大纲的状态
C-c C-n/p	 	下/上一标题
C-c C-f/b	 	下/上一标题（仅限同级标题）
C-c C-u	 		跳到上一级标题
C-c C-j	 		切换到大纲浏览状态
M-RET	 		插入一个同级标题
M-S-RET	 		插入一个同级TODO标题
M-LEFT/RIGHT   	将当前标题升/降级
M-S-LEFT/RIGHT	将子树升/降级
M-S-UP/DOWN	 	将子树上/下移

C-c C-t			切换标签状态 TODO、CLOSE
C-c C-v			查看所有TODO
C-c !			插入时间（使用shift＋方向键选择日期）
C-c C-s			插入计划时间
C-c C-d			插入截止时间
########################################"))

;; org 自动换行
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

;; 设置org缩进
(setq org-startup-indented t)

(provide 'init-org)
;;; init-org.el ends here
