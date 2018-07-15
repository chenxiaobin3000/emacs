;;; init-dired.el --- dired mode
;;; Commentary:

;;; Code:

;; myhelp-dired
(defun myhelp-dired ()
  "Show dired key map help."
  (interactive)
  (help-few-windows "
########################################
C		copy
R		rename/mv
D		delete
+		mkdir
M		chmod
k		临时过滤文件，刷新恢复
g		刷新
d		标记删除
x		执行删除
t		标记所有文件
m		mark
u		unmark
U		unmark all
%%m		mark for regexp: \.html$
i		显示目录内容
;		隐藏目录内容
Q		替换选定文件内字符串

q			返回上级目录，不新开窗口
backspace	返回上级目录，不新开窗口
^			返回上级目录，新开窗口

C-o			显示/隐藏文件详细信息
M-o			显示/隐藏默认隐藏文件
C-x C-j		dired-jump 跳转buffer所在目录
C-x 4 C-j	dired-jump-other-window 同上
C-x C-q		wdired

ret			打开文件
C-ret		other-window打开，焦点不变
M-ret		外部程序打开
########################################"))

;; 显示文件细节
;(setq diredp-hide-details-initially-flag nil)

;; dired-x
(require 'dired)
(require 'dired-x)

;; dired+
;(require-package 'dired+)
(require 'dired+)

(require-package 'dired-subtree)
(require 'dired-subtree)

;(require-package 'dired-sort)
(require 'dired-sort)

;; dired配置
(setq dired-dwim-target t)					;; 双窗口的时候，R/C会以另一个窗口为目标路径
(setq dired-listing-switches "-alh")		;; 使用kb,mb,gb表示文件大小
(setq dired-recursive-copies 'always)		;; 目录操作直接递归，不询问
(setq dired-recursive-deletes 'top)			;; 目录操作直接递归，询问1次
(setq dired-subtree-use-backgrounds nil)	;; 取消子树背景色
(put 'dired-find-alternate-file 'disabled nil)

(add-hook 'dired-mode-hook 'dired-mode-hook-func)
(add-hook 'dired-after-readin-hook 'dired-directory-sort)

;; dired mode hook func
(defun dired-mode-hook-func nil
   "Dired mode hook func."
   (interactive)
   (setq dired-omit-files "^#\\|^\\..*")
   ;(setq dired-omit-extensions '(".cache"))
   (dired-omit-mode 1)
   (evil-emacs-state)
   (define-key dired-mode-map (kbd "i") 'dired-subtree-insert)
   (define-key dired-mode-map (kbd ";") 'dired-subtree-remove)
   (define-key dired-mode-map (kbd "q") 'dired-my-up-directory)
   (define-key dired-mode-map (kbd "M-o") 'dired-omit-mode)
   (define-key dired-mode-map (kbd "C-o") 'dired-hide-details-mode)
   (define-key dired-mode-map (kbd "<backspace>") 'dired-my-up-directory)
   (define-key dired-mode-map (kbd "<return>") 'dired-my-find-alternate-file)
   (define-key dired-mode-map (kbd "RET") 'dired-my-find-alternate-file)
   (define-key dired-mode-map (kbd "<C-return>") 'dired-find-file-other-window)
   (define-key dired-mode-map (kbd "<M-return>") 'dired-my-find-file-other-window))

;; 目录置顶
(defun dired-directory-sort ()
  "Dired sort hook to list directories first."
  (save-excursion
    (let (buffer-read-only)
      (forward-line 2) ;; beyond dir. header
      (sort-regexp-fields t "^.*$" "[ ]*." (point) (point-max))))
  (and (featurep 'xemacs)
       (fboundp 'dired-insert-set-properties)
       (dired-insert-set-properties (point-min) (point-max)))
  (set-buffer-modified-p nil))

;; 在原窗口退回父目录
(defun dired-my-up-directory ()
  "Go back to the parent directory (..).
and the cursor will be moved to where the previous directory."
  (interactive)
  (let* ((DIR (buffer-name)))
    (if (equal DIR "*Find*")
        (quit-window t)
      (progn (find-alternate-file "..")
             (re-search-forward DIR nil :no-error)
             (revert-buffer)))))

;; 在原窗口打开新目录
(defun dired-my-find-alternate-file ()
  "Dired my find alternate file."
  (interactive)
  (if (file-regular-p (dired-get-filename))
      (dired-find-file)
    (dired-find-alternate-file)))

;; 在另一个窗口打开但是光标保留在dired内
(defun dired-my-find-file-other-window ()
  "Dired my find file other window."
  (interactive)
  (dired-find-file-other-window)
  (other-window -1))

;; 调用外部程序打开
(defun dired-open-file-with-external-program ()
  "Open file with external program in dired."
  (interactive)
  (let* ((file (dired-get-filename nil t)))
    (message "Opening %s..." file)
    (call-process-shell-command (concat "open " file))
    (message "Opening %s done" file)))

(provide 'init-dired)
;;; init-dired.el ends here
