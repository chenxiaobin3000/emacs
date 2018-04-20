;;; init-evil.el --- evil mode
;;; Commentary:

;;; Code:

;; myhelp-vi
(defun myhelp-vi ()
  "Show vi key map help."
  (interactive)
  (help-few-windows "
########################################
:s/a/b/g		替换当前行所有a
:%%s/a/b/		替换所有行第一个a
:%%s/a/b/g		全局替换
:s#a#b#			用#代替/
:s+a+b+			用+代替/

n,m				第n行到第m行
%%				1,$
.,$				当前行到结尾
.,n				当前行下n行

:g/pattern/d	删除匹配行
:g!/pattern/d	删除未匹配行

cs')		替换'为) -- evil-surround
ds'			删除'
ysiw'		为单词添加'
yss'		为当前行添加'
ySS'		为当前行添加'，'为上下行，也可以用ySs
t			代表<>标签

gx			选中块，第二次交换块 -- evil-exchange
gX			取消所有选中块
gxx			选中当前行

SPC ;		切换注释 -- evil-nerd-commenter
########################################"))

;; 绑定C-u到翻页，必须在前面
(setq evil-want-C-u-scroll t)

(require-package 'evil)
(evil-mode 1)

;; evil-surround: 强大的替换
(require-package 'evil-surround)
(global-evil-surround-mode 1)

;; evil-exchange: 交换块
(require-package 'evil-exchange)
(evil-exchange-install)

;; evil-nerd-commenter: 添加／取消注释
(require-package 'evil-nerd-commenter)

;; evil-leader: 快捷键
(require-package 'evil-leader)
(global-evil-leader-mode)
(evil-leader/set-leader "<SPC>")
(evil-leader/set-key
  ";" 'evilnc-comment-or-uncomment-lines
  "ci" 'evilnc-comment-or-uncomment-lines
  "cl" 'evilnc-quick-comment-or-uncomment-to-the-line
  "cc" 'evilnc-copy-and-comment-lines
  "cp" 'evilnc-comment-or-uncomment-paragraphs
  "cr" 'comment-or-uncomment-region
  "cv" 'evilnc-toggle-invert-comment-line-by-line)

;; 设置insert模式为emacs模式
(defalias 'evil-insert-state 'evil-emacs-state)

;; 全局配置
(setq evil-default-state 'emacs)

;; 指定mode初始化状态
(evil-set-initial-state 'speedbar-mode 'emacs)

;; 指定光标
(setq evil-emacs-state-cursor 'bar)

(provide 'init-evil)
;;; init-evil.el ends here
