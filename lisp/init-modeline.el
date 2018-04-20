;;; init-modeline.el --- modeline mode
;;; Commentary:

;;; Code:
(require-package 'smart-mode-line)

;; 去除启动提示
(setq sml/no-confirm-load-theme t)

;; 设置主题
(setq sml/theme 'light)

(sml/setup)

;; 不在状态栏显示指定模式
(setq rm-excluded-modes
	  '(" Abbrev"			;; abbrev
		" ARev"				;; auto-revert
		" AC"				;; auto-complete
		" GitGutter"		;; git gutter
		" hs"				;; hide/show mode
		" Ind"				;; org indent
		" ivy"				;; ivy
		" Project"			;; eproject
		" yas"				;; yasnippet
		" Undo-Tree"		;; undo tree
		))

(provide 'init-modeline)
;;; init-modeline.el ends here
