;;; init-php.el --- php mode
;;; Commentary:

;;; Code:
(require-package 'php-mode)
(require-package 'ac-php)
(require-package 'company-php)

(add-hook 'php-mode-hook
          '(lambda ()
             (require 'company-php)
             (ac-php-core-eldoc-setup) ;; enable eldoc
             (make-local-variable 'company-backends)
             (add-to-list 'company-backends 'company-ac-php-backend)

			 (define-key php-mode-map (kbd "M-.") 'ac-php-find-symbol-at-point)
			 (define-key php-mode-map (kbd "M-*") 'ac-php-location-stack-back)))

(provide 'init-php)
;;; init-php.el ends here
