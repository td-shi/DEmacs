;;; operation-config.el --- Emacs environmental elisp package configration file

;; Created: 2021-01-07
;; Version: 1.0
;; Keywords: opration config

;;; Commentary:
;; Now Settings.
;; - Anything
;; - CUA
;; - which-key
;; - autoinsert
;; - skk
;; - Color-theme
;; - powerline
;; - yasnipet

;;; Code:
;; Anything.el setting
(when (require 'anything nil t)
  (setq anything-idle-delay 0.2                   ; Delay time after pressed key
        anything-input-idle-delay 0.3             ; Delay time after pressed key
        anything-candidate-number-limit 100       ; Max popup of one data shown
        anything-quick-update t                   ; Others when shwon data is delayed
        anything-enable-shortcuts 'alphabet)      ; Alphabet shortcut is apply
  (when (require 'anything-config nil t)
    (setq anyting-su-or-sudo "sudo")))            ; Right of root command is "sudo"

;; CUA binds free
(when (require 'cua-mode nil t)
  (cua-mode t)
  (setq cua-enable-cua-keys nil))

;; which-key
(when (require 'which-key nil t)
  (which-key-setup-side-window-bottom)
  (which-key-mode 1))

;; autoinsert
(when (require 'cl nil t)
  (setq auto-insert-directory "~/.emacs.d/template")
  (defvar template-replacements-alists
    '(("%file-name%" . (lambda () (file-name-nondirectory (buffer-file-name))))
      ("%file-name-no-ext%" . (lambda () (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))) ; file-name.ext of "ext"
      ("%file-name-up%" . (lambda () (upcase (file-name-nondirectory (buffer-file-name)))))
      ("%file-name-no-ext-up%" . (lambda () (upcase (file-name-sans-extension (file-name-nondirectory (buffer-file-name))))))
      ("%date-T0%" . (lambda () (format-time-string "%Y-%m-%dT%H:%M:%S")))
      ("%date-T1%" . (lambda () (format-time-string "%Y-%m-%d")))
      ("%date-T2%" . (lambda () (format-time-string "%Y")))
      ("%id%" . (lambda () (identity "td-shi")))))
  (defun sg-template ()
    (time-stamp)
    (mapc #'(lambda(c)
              (progn
                (goto-char (point-min))
                (replace-string (car c) (funcall (cdr c)) nil)))
          template-replacements-alists)
    (goto-char (point-max))
    (message "done.")))
(when (require 'autoinsert nil t)
  (setq auto-insert-alist
        (nconc '(
                 ("test_.+\\.py$"                . ["python-template02.py" sg-template])
                 ("\\.py$"                       . ["python-template01.py" sg-template])
                 ("\\.c$"                        . ["c-template01.c"       sg-template])
                 ("\\.cpp$"                      . ["cpp-template01.cpp"   sg-template])
                 ("\\.h$"                        . ["h-template01.h"       sg-template])
                 ("_Rest\\.org$"                 . ["org-template03.org"   sg-template])
                 ("\\.org$"                      . ["org-template01.org"   sg-template])
                 ("\\.sh$"                       . ["shell-template01.sh"  sg-template])
                 ("\\.vhd$"                      . ["vhd-template01.vhd"   sg-template])
                 ) auto-insert-alist))
  (add-hook 'find-file-not-found-hooks 'auto-insert))

;; SKK
(when (require 'skk nil t)
  (setq defalut-input-method "japanese-skk")
  (setq skk-jisyo-code 'utf-8)
  (setq skk-henkan-show-candidates-rows 2)
  (setq skk-large-jisyo "~/.emacs.d/skk-get-jisyo/SKK-JISYO-U8.sgown")
  (require 'skk-study))

;; Color-theme
(load-theme 'badwolf t)
(font-lock-add-keywords nil '(("^[^\n]\\{160\\}\\(.*\\)$" 1 font-lock-warning-face t)))

;; powerline
(defun powerline-my-theme ()
  "Setup the my mode-line."
  (interactive)
  (setq powerline-current-separator 'utf-8)
  (setq-default mode-line-format
                '("%e"
                  (:eval
                   (let* ((active (powerline-selected-window-active))
                          (mode-line (if active 'mode-line 'mode-line-inactive))
                          (face1 (if active 'mode-line-1-fg 'mode-line-2-fg))
                          (face2 (if active 'mode-line-1-arrow 'mode-line-2-arrow))
                          (face3 (if active 'mode-line-3-fg 'mode-line-2-fg))
                          (separator-left (intern (format "powerline-%s-%s"
                                                          (powerline-current-separator)
                                                          (car powerline-default-separator-dir))))
                          (lhs (list (powerline-raw " " face1)
                                     (powerline-major-mode face1)
                                     (powerline-raw " " face1)
                                     (funcall separator-left face1 face2)
                                     (powerline-minor-modes face3)
                                     (funcall separator-left face3 face2)
                                     (powerline-buffer-id nil)
                                     (powerline-raw " [ ")
                                     (powerline-raw mode-line-mule-info nil)
                                     (powerline-raw "%*" nil)
                                     (powerline-raw " |")
                                     (powerline-process nil)
                                     (powerline-vc)
                                     (powerline-raw " | ")
                                     (powerline-raw "%2p")
                                     (powerline-raw " ]")
                                     ))
                          (rhs (list (powerline-raw "%4l")
                                     (powerline-raw ":")
                                     (powerline-raw "%3c")
                                     (powerline-raw " | ")
                                     (powerline-raw (format-time-string "%Y-%m %H:%M"))
                                     (powerline-raw " ")
                                     )))
                     (concat (powerline-render lhs)
                             (powerline-fill nil (powerline-width rhs))
                             (powerline-render rhs)))))))

(defun make/set-face (face-name fg-color bg-color weight)
  (make-face face-name)
  (set-face-attribute face-name nil :foreground fg-color :background bg-color :box nil :weight weight))

(when (and (require 'powerline nil t) window-system t)
  (make/set-face 'mode-line-1-fg "#282C34" "#EF8300" 'bold)
  (make/set-face 'mode-line-2-fg "#AAAAAA" "#2F343D" 'bold)
  (make/set-face 'mode-line-3-fg "#282C34" "#00EF83" 'bold)
  (make/set-face 'mode-line-1-arrow  "#282C34" "#282C34" 'bold) ;; Same Color
  (make/set-face 'mode-line-2-arrow  "#282C34" "#282C34" 'bold) ;; Same Color
  (powerline-my-theme))

;; yasippet
(when (require 'yasnippet nil t)
  (setq yas-snippet-dirs '("~/.emacs.d/snippet"))
  (yas-global-mode 1)
  (custom-set-variables '(yas-new-snippet-default "
# -*- mode: snippet -*-
# name $1
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-aroud-region 'nil))
# --
$0"))
  (defun yas/expand-link (key)
    "Hyperlink function for yasnippet expansin."
    (delete-region (point-at-bol) (1+ (point-at-eol)))
    (insert key)
    (yas/expand))
  (defun yas/expand-link-choice (&rest keys)
    "Hyperlink to select yasnippet template."
    (yas/expand-link (completing-read "select template: " keys nil t))))

;; magit loading windows nill
;;(when (require 'magit nil t))

;; textlint flycheck
(when (require `flycheck)
  (flycheck-define-checker
   textlint
   "A linter for prose."
   :command ("textlint" "--format" "unix" source-inplace)
   :error-patterns ((warning line-start (file-name) ":" line ":" column ": "
                             (id (one-or-more (not (any " "))))
                             (message (one-or-more not-newline)
                                      (zero-or-more "\n" (any " ") (one-or-more not-newline)))
                             line-end))
   :modes (text-mode markdown-mode org-mode))
  (add-to-list `flycheck-checkers `textlint))

;; Org
(custom-set-variables '(org-html-head-include-scripts nil))
(custom-set-variables '(org-html-viewport
                        '((width "device-width")
                          (initial-scale "1")
                          (minimum-scale "1")
                          (maximum-scale "")
                          (user-scalable ""))))
(custom-set-variables '(org-html-metadata-timestamp-format "%Y-%m-%d"))

(provide 'operation-config)
;;; operation-config.el ends here
