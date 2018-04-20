;;; init-protobuf.el --- protobuf mode
;;; Commentary:

;;; Code:
(require-package 'protobuf-mode)
(require-package 'flycheck-protobuf)
(require 'flycheck-protobuf)

(add-to-list 'flycheck-checkers 'protobuf-protoc-reporter t)

(provide 'init-protobuf)
;;; init-protobuf.el ends here
