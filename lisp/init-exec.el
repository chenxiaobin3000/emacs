;;; init-exec.el --- exec
;;; Commentary:

;;; Code:

;; PATH是在shell中使用
(setenv "PATH" "/bin:/sbin:/usr/bin:/usr/sbin:/usr/local/bin:/usr/local/sbin")

(setenv "IPY_TEST_SIMPLE_PROMPT" "1")
(setenv "MAVEN_HOME" "/usr/local/maven")
(setenv "DOTNET_HOME" "/usr/local/share/dotnet")
(setenv "GOROOT" "/usr/local/opt/go/libexec")
(setenv "GOPATH" "/Users/chenxiaobin/Documents/go")

(setenv "PATH" (concat (getenv "PATH") ":" (getenv "MAVEN_HOME") "/bin"))
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "DOTNET_HOME")))
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "GOROOT") "/bin"))
(setenv "PATH" (concat (getenv "PATH") ":" (getenv "GOPATH") "/bin"))
(setenv "PATH" (concat (getenv "PATH") ":/Users/chenxiaobin/sh"))

;; exec-path是emacs本身找到指定功能的程序，比如压缩，编译
(setq exec-path
	  (split-string
"/bin
/sbin
/usr/bin
/usr/sbin
/usr/local/bin
/usr/local/sbin
/usr/local/Cellar/emacs/25.2/libexec/emacs/25.2/x86_64-apple-darwin16.5.0
/Users/chenxiaobin/Documents/go/bin"))

(provide 'init-exec)
;;; init-exec.el ends here
