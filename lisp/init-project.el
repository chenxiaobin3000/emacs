;;; init-project.el --- eproject mode
;;; Commentary:

;;; Code:
(require-package 'projectile)
(require 'projectile)
(projectile-global-mode)
(setq projectile-indexing-method 'native)
(setq projectile-enable-caching t)

;; simple for mode-line
(after-load 'projectile
  (setq-default
   projectile-mode-line
   '(:eval
	 (if (file-remote-p default-directory) " P"
	   (format " P[%s]" (projectile-project-name))))))

(put 'projectile-project-run-cmd 'safe-local-variable 'stringp)
(put 'projectile-project-compilation-cmd 'safe-local-variable 'stringp)

;; replace default projectile index directory function
(defcustom my-projectile-ignore-dir-name
  '("\\."
	"\\.\\."
	"\\.git"
	"\\.idea"
	"\\.svn"
	"\\.settings"
	"\\.vscode"
	"\\.sass-cache"
	"assets"
	"bin"
	"build"
	"classes"
	"dist"
	"debug"
	"easyui"
	"Library"
	"node_modules"
	"obj"
	"release"
	"Temp"
	"target"
    "vendor"
    "vendors")
  "Ignore dir name for projectile."
  :group 'projectile
  :type 'string)

(defcustom my-projectile-ignore-file-name
  '("\\.#.*"
	"__init__.py"
	"workbench.xmi"
	"TAGS"
	"\\.dir-locals.el"
	"\\.DS_Store"
	"\\.classpath"
	"\\.gitignore"
	"\\.project"
	"\\.projectile"
	"\\.bin"
	"\\.bmp"
	"\\.class"
	"\\.dll"
	"\\.exe"
	"\\.gif"
	"\\.iml"
	"\\.jar"
	"\\.jpg"
	"\\.jpeg"
	"\\.meta"
	"\\.lock"
	"\\.o"
	"\\.png"
	"\\.pyc"
	"\\.test"
	"\\.so")
  "Ignore file name for projectile."
  :group 'projectile
  :type 'string)

(defun my-projectile-ignore-dir-name-p (file list)
  "Ignore dir name for projectile."
  (let ((name (car list)))
	(let ((name-regex (concat name "/$")))
	  (if list
		  (if (string-match name-regex file) nil
			(my-projectile-ignore-dir-name-p file (cdr list)))
		file))))

(defun my-projectile-ignore-file-name-p (file list)
  "Ignore file name for projectile."
  (let ((name (car list)))
	(let ((name-regex (concat "^.*" name "$")))
	  (if list
		(if (string-match name-regex file) nil
		  (my-projectile-ignore-file-name-p file (cdr list)))
		file))))

(defun projectile-index-directory (directory patterns progress-reporter)
  "Replace default projectile index directory function."
  (apply 'append
         (mapcar
          (lambda (f)
		   	(progress-reporter-update progress-reporter)
			(if (file-directory-p f)
				(if (my-projectile-ignore-dir-name-p
					 (file-name-as-directory f)
					 my-projectile-ignore-dir-name)
					(projectile-index-directory f patterns progress-reporter))
			  (if (my-projectile-ignore-file-name-p
				   f
				   my-projectile-ignore-file-name)
                  (list f))))
          (directory-files directory t))))

(provide 'init-project)
;;; init-project.el ends here
