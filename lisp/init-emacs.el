;;; init-emacs.el --- emacs mode
;;; Commentary:

;;; Code:

;; 使用utf-8编码
(prefer-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq-default buffer-file-coding-system 'utf-8)
(setq save-buffer-coding-system 'utf-8)
(setq coding-system-for-write 'utf-8)

;; 取消启动画面
(setq inhibit-startup-message t)
(setq initial-scratch-message "")

;; 显示时间
(setq display-time-24hr-format t)
(display-time)

;; 设置光标不闪
(blink-cursor-mode 1)

;; 高亮显示要拷贝的区域
(transient-mark-mode t)

;; 选中后输入删除
(delete-selection-mode 1)

;; 设置光标样式
(setq-default cursor-type 'bar)

;; 高亮当前行
(require 'hl-line)
(global-hl-line-mode t)

;; 关闭提示音，mac下去乱码框
(setq visible-bell nil)

;; 简化工具条
(tool-bar-mode -1)
(menu-bar-mode -1)

;; 设置滚轮行数
(setq mouse-wheel-scroll-amount '(1))
(setq mouse-wheel-progressive-speed nil)

;; 括号匹配时显示另外一边的括号，而不是跳到另一个括号
(show-paren-mode t)
(setq show-paren-style 'parentheses)

;; tab缩进长度
(setq-default tab-width 4)
(setq tab-width 4)
(setq-default indent-tabs-mode nil)
(setq indent-tabs-mode nil)
(setq c-basic-offset 4)

;; 询问时的 yes or no 改为 y/n
(fset 'yes-or-no-p 'y-or-n-p)

;; 显示行号
(global-display-line-numbers-mode t)

;; 显示列号
(column-number-mode t)

;; 不自动生成备份文件
(setq-default make-backup-files nil)
(setq auto-save-default nil)

;; 禁止custom添加配置
(setq custom-file "~/.emacs.d/custom.el")
(load custom-file)

;; 消除警告
(setq byte-compile-warnings '(cl-functions))

(provide 'init-emacs)
;;; init-emacs.el ends here
