;;; init.el --- emacs init
;;; Commentary:

;;; Code:
;; (package-initialize) 由init-package来初始化

;(setq spacemacs-start-directory "~/.emacs.d/spacemacs/")
;(load-file (concat spacemacs-start-directory "init.el"))

;; 指定配置路径
(add-to-list 'load-path "~/.emacs.d/lisp")
(add-to-list 'load-path "~/.emacs.d/site-lisp")

;; 基础模块
(require 'init-func)			;; 添加自定义函数
(require 'init-package)			;; 依赖包配置
;(require 'init-benchmark-init)	;; 检测启动时间
(require 'init-exec)			;; 配置运行环境
(require 'init-emacs)			;; emacs基础配置
(require 'init-shell)			;; shell配置
(require 'init-keys)			;; 配置快捷键

;; 窗口模块
(require 'init-theme)			;; 颜色配置
(require 'init-ibuffer)			;; 更好看的ibuffer
(require 'init-modeline)		;; 更好看的modeline
(require 'init-windows)			;; 窗口编号
(require 'init-ztree)			;; 目录对比插件
(require 'init-neotree)			;; 侧边栏

;; 编码模块
(require 'init-cscope)
(require 'init-project)			;; 工程插件
(require 'init-flycheck)		;; 错误检查
(require 'init-yasnippet)		;; 模板扩展
(require 'init-company)			;; 自动补全
(require 'init-fold)			;; 配置折叠代码
(require 'init-acejump)			;; 首字母跳转
(require 'init-expand)			;; 扩展选择区域
(require 'init-undo)			;; undo树

;; 扩展模块
(require 'init-dired)			;; 文件目录插件
(require 'init-ediff)			;; 配置ediff
(require 'init-evil)			;; vi模拟插件
(require 'init-smex)
(require 'init-ido)
(require 'init-ivy)
(require 'init-markfile)
(require 'init-multi-term)		;; 终端插件
(require 'init-svn)
(require 'init-git)
(require 'init-compilation)
(require 'init-cursor)			;; 多光标
(require 'init-regexp)			;; 可视化正则

;; 语法模块
(require 'init-org)
(require 'init-csharp)
(require 'init-lisp)
(require 'init-scheme)
(require 'init-go)
(require 'init-python)
(require 'init-web-mode)
(require 'init-javascript)
(require 'init-css)
(require 'init-php)
(require 'init-lua)
(require 'init-markdown)

;;; init.el ends here
