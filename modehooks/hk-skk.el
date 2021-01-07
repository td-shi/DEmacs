;;; hk-skk.el --- simple file description

;; Created: 2018-01-27
;; Version: 0.5
;; Keywords: hk-skk

;;; Commentary:
;; [User Manual Hear]

;;; Code:
;; (add-hook 'skk-mode-hook
;;           (lambda ()
;;             (setq ssk-rom-kana-base-rule-list (skk-del-alist "l" skk-rom-kana-base-rule-list))
;;             (setq skk-rom-kana-rule-list
;;                   (append skk-rom-kana-rule-list
;;                           '(
;;                             ("la"  nil ("ぁ" . "ァ"))
;;                             ("li"  nil ("ぃ" . "ィ"))
;;                             ("lu"  nil ("ぅ" . "ゥ"))
;;                             ("le"  nil ("ぇ" . "ェ"))
;;                             ("lo"  nil ("ぉ" . "ォ"))
;;                             ("ltu" nil ("っ" . "ッ"))
;;                             ("lke" nil ("ヶ" . "ヶ"))
;;                             ("lya" nil ("ゃ" . "ャ"))
;;                             ("lyu" nil ("ゅ" . "ュ"))
;;                             ("lyo" nil ("ょ" . "ョ"))
;;                             ("ll"  "l" ("っ" . "ッ"))
;;                             )))))

(provide 'hk-skk)
;;; hk-skk.el ends here
