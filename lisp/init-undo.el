;;; init-undo.el --- undo mode
;;; Commentary:

;;; Code:
(require-package 'undo-tree)
(global-undo-tree-mode)

(defalias 'redo 'undo-tree-redo)

(provide 'init-undo)
;;; init-undo.el ends here
