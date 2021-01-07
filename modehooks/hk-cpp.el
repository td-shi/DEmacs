;;; hk-cpp.el --- hook file for cpp

;; Created: 2017-12-01
;; Version: 0.9
;; Keywords: hook config

;;; Commentary:
;; [User Manual Hear]

;;; TODO:
;; Completation This.

;;; Code:
(add-hook 'c++-mode-hook
          (lambda ()
            (when (require 'c-eldoc nil t)
              (c-turn-on-eldoc-mode)
              (setq c-basic-offset 4)
              (defvar eldoc-idle-delay 0.20))))
(provide 'hk-cpp)
;;; hk-cpp.el ends here
