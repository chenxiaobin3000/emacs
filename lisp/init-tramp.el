;;; init-tramp.el --- tramp mode
;;; Commentary:

;;; Code:
(require 'tramp)

; set completion source
(add-hook
 'after-init-hook
 (lambda ()
   (mapc (lambda (method)
           (tramp-set-completion-function
            method '((tramp-parse-sconfig "~/.ssh/config"))))
         '("ssh" "scp"))))

(provide 'init-tramp)
;;; init-tramp.el ends here
