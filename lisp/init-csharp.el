;;; init-csharp.el --- csharp mode
;;; Commentary:

;;; Code:
(require-package 'csharp-mode)

;; 开启electric-pair-mode
(add-hook
 'csharp-mode-hook
 (lambda ()
   (electric-pair-local-mode 1)))

(provide 'init-csharp)
;;; init-csharp.el ends here
