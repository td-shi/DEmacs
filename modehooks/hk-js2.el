;;; hk-js2.el --- js2-mode fook file

;; Created: 2017-12-01
;; Version: 0.9
;; Keywords: hook config

;;; Commentary:

;;; Code:
(when (require 'js2-mode nil t)
  (setq js2-cleanup-whitespace nil
        js2-mirror-mode nil
        js2-bounce-indent-flag nil
        js2-include-browser-externs nil
        js2-mode-show-parse-errors nil
        js2-mode-show-strict-warnings nil
        js2-highlight-external-variables nil
        js2-include-jslint-globals nil)
  (eval-after-load 'flycheck
    '(custom-set-variables
      '(flycheck-disabled-checkers '(javascript-jshint javascript-jscs))
      ))
  (setq auto-mode-alist (cons '("\\.js$" . js2-mode) auto-mode-alist))
  (add-hook 'js2-mode-hook
            (lambda()
              (setq c-basic-offset 4))))

(provide 'hk-js2)
;;; hk-js2.el ends here
