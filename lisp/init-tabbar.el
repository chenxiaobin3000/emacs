;;; init-tabbar.el --- tabbar mode
;;; Commentary:

;;; Code:
(require-package 'tabbar)
(tabbar-mode 1)

;; close default tabs，and move all files into one group
(setq tabbar-buffer-list-function
    (lambda ()
        (remove-if
          (lambda(buffer)
             (find (aref (buffer-name buffer) 0) " *"))
          (buffer-list))))
(setq tabbar-buffer-groups-function (lambda()(list "All")))

;; set tabbar's backgroud color
(set-face-attribute 'tabbar-default nil
                    :background "gray80"
                    :foreground "gray80")
(set-face-attribute 'tabbar-selected nil
                    :inherit 'tabbar-default
                    :background "gray20"
                    :foreground "light green"
                    :box '(:line-width 3 :color "gray20") )
(set-face-attribute 'tabbar-unselected nil
                    :inherit 'tabbar-default
                    :background "gray60"
                    :foreground "black"
                    :box '(:line-width 3 :color "gray60"))

;; set tabbar's separator gap
(custom-set-variables '(tabbar-separator (quote (0.3))))

(provide 'init-tabbar)
;;; init-tabbar.el ends here
