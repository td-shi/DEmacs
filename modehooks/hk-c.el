;;; hk-c.el --- hook file for c

;; Created: 2017-12-01
;; Version: 0.9
;; Keywords: hook config

;;; Commentary:

;;; Code:
(add-hook 'c-mode-hook
          (lambda()
            (when (require 'c-eldoc nil t)
              (c-turn-on-eldoc-mode)
              (setq c-basic-offset 4)
              (defvar eldoc-idle-delay 0.20))))
(provide 'hk-c)
;;; hk-c.el ends here
