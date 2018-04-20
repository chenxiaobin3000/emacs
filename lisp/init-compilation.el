;;; init-compilation.el --- compilation mode
;;; Commentary:

;;; Code:

(setq compilation-window-height 10)
(setq compilation-scroll-output t)

;; enable ansi color with compilation
(require 'ansi-color)
(defun colorize-compilation-buffer ()
  (toggle-read-only)
  (ansi-color-apply-on-region compilation-filter-start (point))
  (toggle-read-only))
(add-hook 'compilation-filter-hook 'colorize-compilation-buffer)

(provide 'init-compilation)
;;; init-compilation.el ends here
