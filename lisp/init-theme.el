;;; init-theme.el --- theme
;;; Commentary:

;;; Code:
(require-package 'color-theme-sanityinc-solarized)
(color-theme-sanityinc-solarized-dark)

;; mac下设置
(defun custom-set-font-mac ()
  "Custom set font mac."
  ;; 启动最大化
  (add-hook 'window-setup-hook 'toggle-frame-maximized t)
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
  ;; 设置英文字体
  (set-face-attribute 'default nil :font "Courier New 14" :bold t))

;; console下设置
(defun custom-set-font-console ()
  "Custom set font console."
  (set-face-attribute 'default nil :height 180))

;; 判断系统对应设置
(if window-system
    (cond
     ((eq system-type 'darwin) (custom-set-font-mac))
     ((eq system-type 'windows-nt) (custom-set-font-win)))
  (custom-set-font-console))

(provide 'init-theme)
;;; init-theme.el ends here
