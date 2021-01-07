;;; hk-elisp.el --- hook file for elisp

;; Created: 2017-12-01
;; Version: 0.9
;; Keywords: hook config

;;; Commentary:
;; [User Manual Hear]

;;; TODO:
;; Completation This.

;;; Code:
(add-hook 'emacs-lisp-mode-hook
          (lambda ()
            (when (require 'paredit nil t)
              (enable-paredit-mode))
            (when (require 'eldoc nil t)
              (turn-on-eldoc-mode)
              (defvar eldoc-idle-delay 0.20)
              (defvar eldoc-echo-area-use-multiline-p t))))
(provide 'hk-elisp)
;;; hk-elisp.el ends here
