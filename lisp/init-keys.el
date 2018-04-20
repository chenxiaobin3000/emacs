;;; init-keys.el --- keys
;;; Commentary:

;;; Code:

;; myhelp-keys
(defun myhelp-keys ()
  "Show Emacs key map help."
  (interactive)
  (help-few-windows "
########################################
F1			代替C-h

C-num		重复num次执行
M-y			移动剪切环
M-SPC		标记开始
C-u M-SPE	跳回标记处
M-;			切换块注释
C-c r		可视正则替换(逐行)
C-c q		可视正则替换
C-h			进入evil模式
C-M-方向	增大buffer
C-c SPE		ace-jump
C-c C-SPE	ace-back
C-c m		多光标模式
C->			上一行
C-<			下一行

C-c ?		快捷帮助菜单

F5			运行
F6			编译
F7			中止操作
F8			打开终端

M-%%   		替换query-replace
M-.			etags 跳转
M-*			跳回到之前的地方
C-x 4 .		在另一buffer中定位

C-q C-m		输入^M

tramp		/ssh:user@host:/path
########################################"))

;; 快捷键设置
(global-set-key (kbd "M-SPC") 'set-mark-command)
(global-set-key (kbd "C-x f") 'find-file)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "C-x 5 f") 'my-find-file-other-window)
(global-set-key (kbd "C-x 5 b") 'my-switch-to-buffer-other-window)
(global-set-key (kbd "C-x d") 'markfile-find-file)
(global-set-key (kbd "C-x C-d") 'markfile-find-file)
(global-set-key (kbd "C-x p") 'projectile-find-file)
(global-set-key (kbd "C-x C-p") 'projectile-find-file)
(global-set-key (kbd "M-x") 'smex)
(global-set-key (kbd "M-X") 'counsel-M-x)
(global-set-key (kbd "M-d") 'my-kill-word)
(global-set-key (kbd "M-s") 'save-buffer)
(global-set-key (kbd "C-x k") 'kill-this-buffer)
(global-set-key (kbd "C-x C-k") 'kill-matching-buffers)
(global-set-key (kbd "C-x C-b") 'ibuffer)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "C--") 'hs-hide-level)
(global-set-key (kbd "C-+") 'hs-show-all)
(global-set-key (kbd "C-=") 'er/expand-region)
(global-set-key (kbd "C-t") 'insert-tab-char) ;; 输入tab
(global-set-key [remap move-beginning-of-line]
                'smarter-move-beginning-of-line) ;; 重定义c-a
(global-set-key (kbd "M-n") 'my-scroll-up)
(global-set-key (kbd "M-p") 'my-scroll-down)
(global-set-key (kbd "M-o") 'ff-find-other-file) ;; 跳转到文件
(global-set-key (kbd "C-h") 'evil-normal-state) ;; 进入evil模式
(global-set-key (kbd "M-;") 'evilnc-comment-or-uncomment-lines)
(global-set-key (kbd "C-M-;") 'hide/show-comments-toggle)
(global-set-key (kbd "C-c ?") 'quick-help-menu)
(global-set-key (kbd "C-c f") 'origami-recursively-toggle-node)
(global-set-key (kbd "C-c F") 'origami-toggle-all-nodes)
(global-set-key (kbd "C-c i") 'counsel-imenu)
(global-set-key (kbd "C-c k") 'delete-indentation)
(global-set-key (kbd "C-c q") 'vr/query-replace)
(global-set-key (kbd "C-c r") 'vr/replace)
(global-set-key (kbd "C-c s") 'swiper)

(global-set-key (kbd "C-M-<left>") 'shrink-window-horizontally)
(global-set-key (kbd "C-M-<right>") 'enlarge-window-horizontally)
(global-set-key (kbd "C-M-<up>") 'shrink-window)
(global-set-key (kbd "C-M-<down>") 'enlarge-window)

;; ace jump
(global-set-key (kbd "C-SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c SPC") 'ace-jump-mode)
(global-set-key (kbd "C-c C-SPC") 'ace-jump-mode-pop-mark)

;; multi cursor
(global-set-key (kbd "C-c m") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-unset-key (kbd "M-<down-mouse-1>"))
(global-set-key (kbd "M-<mouse-1>") 'mc/add-cursor-on-click)

(global-set-key (kbd "<tab>") 'tab-indent-or-complete)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f5>") 'projectile-run-project)
(global-set-key (kbd "<f6>") 'projectile-compile-project)
(global-set-key (kbd "<f7>") 'kill-compilation)
(global-set-key (kbd "<f8>") 'multi-term-dedicated-toggle)
(global-set-key (kbd "<f9>") 'neotree-toggle)

;; cscope
(global-set-key (kbd "C-\. s") 'cscope-find-this-symbol)
(global-set-key (kbd "C-\. g") 'cscope-find-global-definition)
(global-set-key (kbd "C-\. G") 'cscope-find-global-definition-no-prompting)
(global-set-key (kbd "C-\. c") 'cscope-find-functions-calling-this-function)
(global-set-key (kbd "C-\. C") 'cscope-find-called-functions)
(global-set-key (kbd "C-\. t") 'cscope-find-this-text-string)
(global-set-key (kbd "C-\. e") 'cscope-find-egrep-pattern)
(global-set-key (kbd "C-\. f") 'cscope-find-this-file)
(global-set-key (kbd "C-\. i") 'cscope-find-files-including-file)

(global-set-key (kbd "C-\. b") 'cscope-display-buffer)
(global-set-key (kbd "C-\. B") 'cscope-display-buffer-toggle)
(global-set-key (kbd "C-\. n") 'cscope-next-symbol)
(global-set-key (kbd "C-\. N") 'cscope-next-file)
(global-set-key (kbd "C-\. p") 'cscope-prev-symbol)
(global-set-key (kbd "C-\. P") 'cscope-prev-file)
(global-set-key (kbd "C-\. u") 'cscope-pop-mark)

(global-set-key (kbd "C-\. a") 'cscope-set-initial-directory)
(global-set-key (kbd "C-\. A") 'visit-tags-table)

(provide 'init-keys)
;;; init-keys.el ends here
