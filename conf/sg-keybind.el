;;; sg-keybind.el --- key bindings file

;; Created: 2021-01-07
;; Version: 1.0
;; Keywords: bindings config

;;; Commentary:
;; My bindings and my utility functions.

;;; Code:
;; window size resize.
(defun sg-window-resizer ()
  "Control Window Size and Position."
  (interactive)                                   ; M-x Allows
  (let ((window-obj (selected-window))            ; Get window
  (current-width (window-width))                  ; Get window width
  (current-height (window-height))                ; Get window height
  (dx (if (= (nth 0 (window-edges)) 0) 1 -1))     ; dx = 1 or -1
  (dy (if (= (nth 1 (window-edges)) 0) 1 -1))     ; dy = 1 or -1
  action c)
    (catch 'end-flag
      (while t
        (setq action
              (read-key-sequence-vector           ; Get Pressed Key
               (format "size[width:%d height:%d]" ; Show Current Size
                       (window-width)
                       (window-height))))
        (setq c (aref action 0))
        (cond ((= c ?l)
               (enlarge-window-horizontally dx))            ; "l" dx window large
              ((= c ?d)
               (enlarge-window-horizontally (* dx 10)))     ; "d" 10dx window large
              ((= c ?j)
               (shrink-window-horizontally dx))             ; "j" dx window smaller
              ((= c ?a)
               (shrink-window-horizontally (* dx 10)))      ; "a" 10dx window smaller
              ((= c ?i)
               (enlarge-window dy))                         ; "i" dy window large
              ((= c ?w)
               (enlarge-window (* dy 10)))                  ; "w" 10dy window large
              ((= c ?k)
               (shrink-window dy))                          ; "k" dy window smaller
              ((= c ?s)
               (shrink-window (* dy 10)))                   ; "s" 10dy window smaller
              (t (let ((last-command-char (aref action 0))  ; Another keys Quit this function.
                       (command (key-binding action)))
                   (when command
                     (call-interactively command)))
                 (message "Quit")
                 (throw 'end-flag t)))))))

;; line moving
(defun move-line-down ()
  (interactive)
  (let ((col (current-column)))                   ; Get Current column
    (save-excursion                               ; Change Current line and next
      (forward-line)
      (transpose-lines 1))
    (forward-line)                                ; Key input point next
    (move-to-column col)))

(defun move-line-up ()
  (interactive)
  (let ((col (current-column)))                   ; Get Current column
    (save-excursion                               ; Change Current line and prev
      (forward-line)
      (transpose-lines -1))
    (move-to-column col)                          ; key input point prev
    (forward-line -1)))

;; SKK toggle-kutouten
(defun toggle-kuten-type nil
  (interactive)
  (cond
   ((equal skk-kutouten-type 'en)
    (setq-default skk-kutouten-type 'jp))
   ((equal skk-kutouten-type 'jp)
    (setq-default skk-kutouten-type 'en))
   ((t nil))))

(when (require 'bind-key nil t)
  (defvar sg-map (make-sparse-keymap) "m-sasaki-Prefix-Map")
  (defalias 'Control-Z-prefix sg-map)
  (bind-keys :map global-map
             ("C-t" . other-window)               ; change window
             ("C-l" . anything)                   ; Anything window open
             ("M-n" . move-line-down)             ; Current line lift down
             ("M-p" . move-line-up)               ; Current line lift up
             ("C-z" . Control-Z-prefix)           ; m-sasaki Keybind map prefix
             ("<henkan>" . toggle-kuten-type)     ; SKK kutoten chenge
             )
  (bind-keys :map sg-map
             ("a" . auto-complete-mode)           ; Run Auto-Complete-Mode
             ("d" . delete-rectangle)             ; Rectangle Region Delete
             ("e" . eval-buffer)                  ; Current Buffer emacs lisp Evaluate
             ("f" . flycheck-mode)                ; Run Flycheck-mode
             ("g" . grep-mode)                    ; Show Grep mode
             ("h" . highlight-phrase)             ; Word Highlight
             ("i" . yas-insert-snippet)           ; Insert snippet
             ("k" . anything-show-kill-ring)      ; Open kill-ring
             ("l" . hi-lock-mode)                 ; Off Highlight
             ("o" . unhighlight-regexp)           ; Off Highlight strict
             ("p" . query-replace-regexp)         ; Replace
             ("r" . highlight-regexp)             ; Word Highlight strict
             ("s" . eshell)                       ; Run emacs shell
             ("t" . string-rectangle)             ; Rectangle Region Replace Strings
             ("w" . sg-window-resizer)            ; Window resize
             ("C-a" . mark-whole-buffer)          ; All Region Colect
             ("C-c" . copy-region-as-kill)        ; Region Copy
             ("C-j" . skk-mode)                   ; SKK mode
             ("C-u" . undo)                       ; Undo
             ("C-v" . clipboard-yank)             ; Paste
             ("C-x" . kill-region)                ; Region Delete
             ))

(provide 'sg-keybind)
;;; sg-keybind.el ends here.
