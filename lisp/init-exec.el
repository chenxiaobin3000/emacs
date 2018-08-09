;;; init-exec.el --- exec
;;; Commentary:

;;; Code:

;; PATH是在shell中使用
(setenv "PATH" "/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin")

;; exec-path是emacs本身找到指定功能的程序，比如压缩，编译
(setq exec-path '("/bin" "/sbin" "/usr/bin" "/usr/sbin" "/usr/local/bin" "/usr/local/sbin"))

(provide 'init-exec)
;;; init-exec.el ends here
