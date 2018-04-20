;;; init-python.el --- python mode
;;; Commentary:

;;; Code:
(require-package 'elpy)
(require-package 'py-autopep8)

;; 设置默认python使用ipython
(setq python-shell-interpreter "ipython")
(setq python-shell-interpreter-args "-i")

;; 设置elpy
(elpy-enable)
(elpy-use-ipython)
(setq elpy-rpc-python-command "python3")
(setq elpy-rpc-backend "jedi")
(setq py-indent-offset 4)
(setq python-indent-guess-indent-offset nil)

(define-key elpy-mode-map [(f5)] (kbd "C-u C-c C-c"))

(add-to-list 'python-shell-completion-native-disabled-interpreters "ipython")

;; 使用flycheck代替flymake
(when (require 'flycheck nil t)
  (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
  (add-hook 'elpy-mode-hook 'flycheck-mode))

;; 保存文件时检测pep8
(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(provide 'init-python)
;;; init-python.el ends here
