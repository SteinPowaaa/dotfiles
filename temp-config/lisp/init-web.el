;;; init-web.el --- Editing HTML -*- lexical-binding: t -*-
;;; Commentary:

;;; Code:

(when (maybe-require-package 'web-mode)
  (add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode)))

(provide 'init-web)
;;; init-web.el ends here
