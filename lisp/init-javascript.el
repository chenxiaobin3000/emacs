;;; init-javascript.el --- js mode
;;; Commentary:

;;; Code:
(require-package 'js2-mode)

;; js2-mode
(require 'js2-mode)
(add-to-list 'auto-mode-alist '("\\.js\\'" . js2-mode))

;; Change some defaults: customize them to override
(setq-default js2-basic-offset 2 js2-bounce-indent-p nil)
(after-load 'js2-mode
  ;; 不用js2的提示，使用flycheck
  (setq-default js2-mode-show-parse-errors nil
                js2-mode-show-strict-warnings nil)

  (add-hook 'js2-mode-hook 'js2-imenu-extras-mode)
  (add-hook 'js2-mode-hook (lambda () (setq mode-name "JS2")))

  (after-load 'js2-mode (js2-imenu-extras-setup)))

;; js-mode
(setq-default js-indent-level 2)

(provide 'init-javascript)
;;; init-javascript.el ends here
