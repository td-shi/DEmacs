;;; hk-org.el --- hook file for Org

;; Created: 2017-12-01
;; Version: 0.9
;; Keywords: hook config

;;; Commentary:

;;; Code:
(setq auto-mode-alist (nconc
                       '(("\\.txt$"  . org-mode)
                         ("\\.org$"  . org-mode)
                         ("\\.orst$" . org-mode)
                         ("\\.morg$" . org-mode))
                       auto-mode-alist))

(add-hook 'org-mode-hook
          (lambda ()
            (when (require 'paredit nil t)
              (enable-paredit-mode))))
(provide 'hk-org)
;;; hk-org.el ends here
