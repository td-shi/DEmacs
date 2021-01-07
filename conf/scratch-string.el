;;; scratch-string.el --- scratch buffer strings configuration file

;; Created: 2021-01-07
;; Version: 1.0
;; Keywords: scratch strings config

;;; Commentary:
;; [User Manual Hear]

;;; Code:
(setq initial-scratch-message
";;; Eshell comands.
egrep -r -n -I \"string\" Dir                ; Any file match
tree                                         ; Dir tree

;;; Often Used Actions.
C-x C-0 character size config

;;; C-z Prefix Actions.
a auto-complete-mode   | d delete-rectangle
e eval-buffer          | f flycheck-mode
g grep-mode            | h highlight-phrase
i yas-insert-snippet   | k anything-show-kill-ring
l hi-lock-mode         | o unhighlight-regexp
p query-replace-regexp | r highlight-regexp
s eshell               | t string-rectangle
w window-resizer       | C-a mark-whole-buffer
C-c copy               | C-j SKK-mode
C-u undo               | C-v paste
C-x kill

;;; M-x Prefix Actions.
auto-complete-mode | paredit-mode      | org-mode
package-list       | yas-new-snippet   | yas-visit-snippet
customize-themes   | toggle-frame-fullscreen
shell              | magit-status
describe-personal-keybindings
")

;(setq initial-scratch-message "Hello, Emacs world!")
(provide 'scratch-string)
;;; scratch-string.el ends here
