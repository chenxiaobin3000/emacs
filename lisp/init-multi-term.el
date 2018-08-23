;;; init-multi-term.el --- multi term mode
;;; Commentary:

;;; Code:
(require-package 'multi-term)

(add-hook
 'term-mode-hook
 (lambda ()
   (setq multi-term-program "/bin/zsh")
   (setq multi-term-dedicated-select-after-open-p t)
   (setq multi-term-dedicated-window-height 14)

   ;; raw(char) mode
   (define-key term-raw-map (kbd "C-p") 'scroll-down)
   (define-key term-raw-map (kbd "C-n") 'scroll-up)

   ;; line mode
   (define-key term-mode-map (kbd "C-p") 'scroll-down)
   (define-key term-mode-map (kbd "C-n") 'scroll-up)

   (define-key term-raw-map (kbd "<tab>") 'term-tab-complete)
   (define-key term-mode-map (kbd "<tab>") 'term-tab-complete)))

(defun term-toggle-mode ()
  "Toggle term between line mode and char mode."
  (interactive)
  (if (term-in-line-mode)
      (term-char-mode)
    (term-line-mode)))

(provide 'init-multi-term)
;;; init-multi-term.el ends here
