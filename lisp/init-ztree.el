;;; init-ztree.el --- ztree mode
;;; Commentary:

;;; Code:

;; myhelp-ztree
(defun myhelp-ztree ()
  "Show ztree key map help."
  (interactive)
  (help-few-windows "
########################################
double-click, RET or Space		打开或关闭目录
Backspace	回到上级目录
x			展开／关闭目录
RET			用ediff比较
Space		下方简单比较窗口
TAB			左右窗口切换
h			key to toggle show/hide identical files/directories
H			key to toggle show/hide hidden/ignored files/directories
C			复制当前文件到对面
D			删除文件或目录
v			快速查看文件
r			刷新当前目录或文件
F5			强制全部重新扫描
########################################"))

(require-package 'ztree)

(provide 'init-ztree)
;;; init-ztree.el ends here
