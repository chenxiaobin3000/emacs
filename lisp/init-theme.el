;;; init-theme.el --- theme
;;; Commentary:

;;; Code:
(require-package 'color-theme-solarized)

(defun my-init-solarized (mode)
  "Init solarized with MODE."
  (load-theme 'solarized t)
  (set-frame-parameter nil 'background-mode mode)
  (set-terminal-parameter nil 'background-mode mode)
  (enable-theme 'solarized))

;; mac下设置
(defun custom-set-font-mac ()
  "Custom set font mac."
  ;; 启动最大化
  (add-hook 'window-setup-hook 'toggle-frame-maximized t)
  ;(add-hook 'window-setup-hook 'toggle-frame-fullscreen t)
  (my-init-solarized 'dark)
  ;; 设置英文字体
  (set-face-attribute 'default nil :font "Ayuthaya 16")
  ;; 设置中文字体
  (dolist (charset '(kana han symbol cjk-misc bopomofo))
	(set-fontset-font (frame-parameter nil 'font)
					  charset (font-spec :family "Hannotate SC" :size 16))))

;; win下设置
(defun custom-set-font-win ()
  "Custom set font win."
  ;; 启动最大化
  (add-hook 'window-setup-hook 'toggle-frame-maximized t)
  (my-init-solarized 'light)
  ;; 设置英文字体
  (set-face-attribute 'default nil :font "Courier New 14" :bold t))

;; console下设置
(defun custom-set-font-console ()
  "Custom set font console."
  (my-init-solarized 'dark)
  (set-face-attribute 'default nil :height 180))

;; 新窗口设置主题，修正emacsclient -c没有显示正确风格，判断系统对应设置
(defun run-after-make-frame-hooks (frame)
  "Run after make frame without FRAME."
  (if window-system
      (cond
       ((eq system-type 'darwin) (custom-set-font-mac))
       ((eq system-type 'windows-nt) (custom-set-font-win)))
    (custom-set-font-console)))
(run-after-make-frame-hooks nil)

(add-hook 'after-make-frame-functions 'run-after-make-frame-hooks)

(provide 'init-theme)
;;; init-theme.el ends here
