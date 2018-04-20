;;; init-ediff.el --- ediff mode
;;; Commentary:

;;; Code:

;; ediff 不开新窗口
(setq ediff-window-setup-function 'ediff-setup-windows-plain)

;; ediff 分页策略
(setq ediff-split-window-function (if (< (frame-width) 60)
	'split-window-vertically 'split-window-horizontally))

;; ediff 比较完恢复窗口状态
(add-hook 'ediff-load-hook (lambda ()
	(add-hook 'ediff-before-setup-hook (lambda ()
		(setq ediff-saved-window-configuration (current-window-configuration))))
	(let ((restore-window-configuration (lambda ()
		(set-window-configuration ediff-saved-window-configuration))))
		(add-hook 'ediff-quit-hook restore-window-configuration 'append)
		(add-hook 'ediff-suspend-hook restore-window-configuration 'append))))

(provide 'init-ediff)
;;; init-ediff.el ends here
