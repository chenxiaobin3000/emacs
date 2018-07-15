;;; init-package.el --- package
;;; Commentary:

;;; Code:
(require 'package)

;; mac下设置源
(defun package-source-mac ()
  "Set package source for mac."
  (interactive)
  ;; 可以用国内镜像源
  (setq package-archives
		'(("melpa" . "http://elpa.emacs-china.org/melpa/")
		  ("gnu" . "http://elpa.emacs-china.org/gnu/"))))
  ;; 可以用官方源
;  (setq package-archives
;		'(("melpa" . "https://melpa.org/packages/")
;		  ("gnu" . "https://elpa.gnu.org/packages/"))))

;; win下设置源
(defun package-source-win ()
  "Set package source for mac."
  (interactive)
  ;; 不使用ssl源
  (setq package-archives
		'(("melpa" . "http://melpa.org/packages/")
		  ("gnu" . "http://elpa.gnu.org/packages/"))))

;; windows下启动gnutls
(if window-system
	(cond
	 ((eq system-type 'darwin) (package-source-mac))
	 ((eq system-type 'windows-nt) (package-source-win))))

;; from Purcell
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (if (boundp 'package-selected-packages)
            ;; Record this as a package the user installed explicitly
            (package-install package nil)
          (package-install package))
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

;; 启动package
(setq package-enable-at-startup nil)
(package-initialize)

(provide 'init-package)
;;; init-package.el ends here
