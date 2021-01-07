;;; eshel-alias.el --- eshel configuration file

;; Created: 2021-01-07
;; Version: 1.0
;; Keywords: eshel alias config

;;; Commentary:

;;; Code:
(defun add-to-eshell-alias (&rest aliases)
  (let (ali)
    (dolist (ali aliases)
      (add-to-list 'eshell-command-aliases-list ali))))     ; Add alias.
(add-to-eshell-alias                                        ; Configration.
 (list "ls" "ls -la $*"))

(provide 'eshel-alias)
;;; eshel-alias.el ends here
