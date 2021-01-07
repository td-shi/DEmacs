;;; init.el --- emacs configuration file

;; Created: 2021-01-07
;; Version: 1.03
;; Keywords: init

;;; Commentary:
;; emacs24.5 japanese infomation file is .emacs.d/conf/handed_install/emacs245-ja.info
;; elip infomation file is .emacs.d/conf/handed_install/elisp.info

;;; Code:
;; Lisp is loaded path, but required yet.
(defun add-to-load-path (&rest paths)
  (let (path)                                                         ; <path> is this function variables.
    (dolist (path paths)
      (let ((default-directory
              (expand-file-name
               (concat user-emacs-directory path))))                  ; <default-directory> must bind for <normal-top-level-add-subdirs-to-load-path>.
        (add-to-list 'load-path default-directory)                    ; Adding path.
        (if (fboundp 'normal-top-level-add-subdirs-to-load-path)
            (normal-top-level-add-subdirs-to-load-path))))))
(add-to-load-path "elpa" "conf" "modehooks")                          ; .emacs.d sub directory's is loaded

;; ELPA Settings.
(when (require 'package nil t)
  (add-to-list 'package-archives '("melpa-stable" . "http://stable.melpa.org/packages/") t)
  (add-to-list 'package-archives '("melpa" . "http://melpa.org/packages/") t)
  (add-to-list 'package-archives '("marmalade" . "https://marmalade-repo.org/packages/") t)
  (add-to-list 'package-archives '("org" . "http://orgmode.org/elpa/") t)
  (add-to-list 'package-archives '("gnu" . "https://elpa.gnu..org/packages/") t)
  (fset 'package-desc-vers 'package--ac-desc-version)                 ; Conversion for emacs23
  (package-initialize))

;; Allways applied configrations
(global-auto-revert-mode 1)                       ; Automatic reload buffer
(setq backup-inhibited t)                         ; No make backup file
(setq make-backup-files nil)                      ; No make backup file
(setq delete-auto-save-files t)                   ; Delete auto save
(column-number-mode t)                            ; Point of column on Buffer show
(size-indication-mode t)                          ; Filesize show
(setq display-time-24hr-format t)                 ; Time is 24h
(display-time-mode t)                             ; Time show
(display-time)                                    ; Time display
(scroll-bar-mode -1)                              ; Scrollbar No show
(setq inhibit-splash-screen t)                    ; No Run Up Emacs Buffer
(setq inhibit-startup-message t)                  ; No Run Up Message
(set-locale-environment nil)                      ; locale nil
(set-language-environment "japanese")             ; language
(set-terminal-coding-system 'utf-8)               ; terminal code
(set-keyboard-coding-system 'utf-8)               ; keyboard code
(set-buffer-file-coding-system 'utf-8)            ; buffer code
(setq default-buffer-file-coding-system 'utf-8)   ; buffer code
(set-default-coding-systems 'utf-8)               ; character code
(prefer-coding-system 'utf-8)                     ; character code
(when (equal system-type 'gnu/linux)              ; Linux Setting
  (cd "~/")                                       ; Startup Directory
  (toggle-frame-fullscreen)                       ; Emacs Frame Maximize
  )
(setq eol-mnemonic-dos "$R$L")                    ; Windows New Line
(setq eol-mnemonic-mac "$R")                      ; Mac New Line
(setq eol-mnemonic-unix "$L")                     ; L/Unix New Line
(setq-default tab-width 4 indent-tabs-mode nil)   ; tab -> 4 space
(show-paren-mode 1)                               ; Lightning ()
(global-whitespace-mode 1)                        ; Space,tab, visible

(defun append-load-config (&rest files)
  (let (file)
    (dolist (file files)
      (load file))))
(append-load-config
 "operation-config"
 "eshell-alias"
 "sg-keybind"
 "scratch-string"
 "hk-js2"
 "hk-elisp"
 "hk-c"
 "hk-cpp"
 "hk-org"
 "hk-skk"
;; "hk-csv"
 )

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("604648621aebec024d47c352b8e3411e63bdb384367c3dd2e8db39df81b475f5" default)))
 '(flycheck-disabled-checkers (quote (javascript-jshint javascript-jscs)))
 '(org-html-head-include-scripts nil)
 '(org-html-metadata-timestamp-format "%Y-%m-%d")
 '(org-html-viewport
   (quote
    ((width "device-width")
     (initial-scale "1")
     (minimum-scale "1")
     (maximum-scale "")
     (user-scalable ""))))
 '(skk-auto-insert-paren nil)
 '(skk-auto-okuri-process nil)
 '(skk-auto-start-henkan t)
 '(skk-backup-jisyo "~/.emacs.d/skk-files/.skk-jisyo-u8.BAK")
 '(skk-cdb-large-jisyo "~/.emacs.d/skk-get-jisyo/SKK-JISYO-U8.sgown.cdb")
 '(skk-check-okurigana-on-touroku nil)
 '(skk-delete-implies-kakutei t)
 '(skk-egg-like-newline t)
 '(skk-emacs-id-file "~/.emacs.d/skk-files/.skk-emacs-id")
 '(skk-henkan-okuri-strictly nil)
 '(skk-henkan-strict-okuri-precedence nil)
 '(skk-j-mode-function-key-usage nil)
 '(skk-japanese-message-and-error nil)
 '(skk-jisyo "~/.emacs.d/skk-files/.skk-jisyo-u8")
 '(skk-kakutei-early nil)
 '(skk-kuten-touten-alist
   (quote
    ((jp "。" . "、")
     (en "." . ",")
     (jp-en "。" . ",")
     (en-jp "." . "、"))))
 '(skk-kutouten-type (quote en))
 '(skk-preload nil)
 '(skk-record-file "~/.emacs.d/skk-files/.skk-record-u8")
 '(skk-rom-kana-base-rule-list
   (quote
    (("a" nil
      ("ア" . "あ"))
     ("bb" "b"
      ("ッ" . "っ"))
     ("ba" nil
      ("バ" . "ば"))
     ("be" nil
      ("ベ" . "べ"))
     ("bi" nil
      ("ビ" . "び"))
     ("bo" nil
      ("ボ" . "ぼ"))
     ("bu" nil
      ("ブ" . "ぶ"))
     ("bya" nil
      ("ビャ" . "びゃ"))
     ("bye" nil
      ("ビェ" . "びぇ"))
     ("byi" nil
      ("ビィ" . "びぃ"))
     ("byo" nil
      ("ビョ" . "びょ"))
     ("byu" nil
      ("ビュ" . "びゅ"))
     ("cc" "c"
      ("ッ" . "っ"))
     ("cha" nil
      ("チャ" . "ちゃ"))
     ("che" nil
      ("チェ" . "ちぇ"))
     ("chi" nil
      ("チ" . "ち"))
     ("cho" nil
      ("チョ" . "ちょ"))
     ("chu" nil
      ("チュ" . "ちゅ"))
     ("cya" nil
      ("チャ" . "ちゃ"))
     ("cye" nil
      ("チェ" . "ちぇ"))
     ("cyi" nil
      ("チィ" . "ちぃ"))
     ("cyo" nil
      ("チョ" . "ちょ"))
     ("cyu" nil
      ("チュ" . "ちゅ"))
     ("dd" "d"
      ("ッ" . "っ"))
     ("da" nil
      ("ダ" . "だ"))
     ("de" nil
      ("デ" . "で"))
     ("dha" nil
      ("デャ" . "でゃ"))
     ("dhe" nil
      ("デェ" . "でぇ"))
     ("dhi" nil
      ("ディ" . "でぃ"))
     ("dho" nil
      ("デョ" . "でょ"))
     ("dhu" nil
      ("デュ" . "でゅ"))
     ("di" nil
      ("ヂ" . "ぢ"))
     ("do" nil
      ("ド" . "ど"))
     ("du" nil
      ("ヅ" . "づ"))
     ("dya" nil
      ("ヂャ" . "ぢゃ"))
     ("dye" nil
      ("ヂェ" . "ぢぇ"))
     ("dyi" nil
      ("ヂィ" . "ぢぃ"))
     ("dyo" nil
      ("ヂョ" . "ぢょ"))
     ("dyu" nil
      ("ヂュ" . "ぢゅ"))
     ("e" nil
      ("エ" . "え"))
     ("ff" "f"
      ("ッ" . "っ"))
     ("fa" nil
      ("ファ" . "ふぁ"))
     ("fe" nil
      ("フェ" . "ふぇ"))
     ("fi" nil
      ("フィ" . "ふぃ"))
     ("fo" nil
      ("フォ" . "ふぉ"))
     ("fu" nil
      ("フ" . "ふ"))
     ("fya" nil
      ("フャ" . "ふゃ"))
     ("fye" nil
      ("フェ" . "ふぇ"))
     ("fyi" nil
      ("フィ" . "ふぃ"))
     ("fyo" nil
      ("フョ" . "ふょ"))
     ("fyu" nil
      ("フュ" . "ふゅ"))
     ("gg" "g"
      ("ッ" . "っ"))
     ("ga" nil
      ("ガ" . "が"))
     ("ge" nil
      ("ゲ" . "げ"))
     ("gi" nil
      ("ギ" . "ぎ"))
     ("go" nil
      ("ゴ" . "ご"))
     ("gu" nil
      ("グ" . "ぐ"))
     ("gya" nil
      ("ギャ" . "ぎゃ"))
     ("gye" nil
      ("ギェ" . "ぎぇ"))
     ("gyi" nil
      ("ギィ" . "ぎぃ"))
     ("gyo" nil
      ("ギョ" . "ぎょ"))
     ("gyu" nil
      ("ギュ" . "ぎゅ"))
     ("ha" nil
      ("ハ" . "は"))
     ("he" nil
      ("ヘ" . "へ"))
     ("hi" nil
      ("ヒ" . "ひ"))
     ("ho" nil
      ("ホ" . "ほ"))
     ("hu" nil
      ("フ" . "ふ"))
     ("hya" nil
      ("ヒャ" . "ひゃ"))
     ("hye" nil
      ("ヒェ" . "ひぇ"))
     ("hyi" nil
      ("ヒィ" . "ひぃ"))
     ("hyo" nil
      ("ヒョ" . "ひょ"))
     ("hyu" nil
      ("ヒュ" . "ひゅ"))
     ("i" nil
      ("イ" . "い"))
     ("jj" "j"
      ("ッ" . "っ"))
     ("ja" nil
      ("ジャ" . "じゃ"))
     ("je" nil
      ("ジェ" . "じぇ"))
     ("ji" nil
      ("ジ" . "じ"))
     ("jo" nil
      ("ジョ" . "じょ"))
     ("ju" nil
      ("ジュ" . "じゅ"))
     ("jya" nil
      ("ジャ" . "じゃ"))
     ("jye" nil
      ("ジェ" . "じぇ"))
     ("jyi" nil
      ("ジィ" . "じぃ"))
     ("jyo" nil
      ("ジョ" . "じょ"))
     ("jyu" nil
      ("ジュ" . "じゅ"))
     ("kk" "k"
      ("ッ" . "っ"))
     ("ka" nil
      ("カ" . "か"))
     ("ke" nil
      ("ケ" . "け"))
     ("ki" nil
      ("キ" . "き"))
     ("ko" nil
      ("コ" . "こ"))
     ("ku" nil
      ("ク" . "く"))
     ("kya" nil
      ("キャ" . "きゃ"))
     ("kye" nil
      ("キェ" . "きぇ"))
     ("kyi" nil
      ("キィ" . "きぃ"))
     ("kyo" nil
      ("キョ" . "きょ"))
     ("kyu" nil
      ("キュ" . "きゅ"))
     ("ma" nil
      ("マ" . "ま"))
     ("me" nil
      ("メ" . "め"))
     ("mi" nil
      ("ミ" . "み"))
     ("mo" nil
      ("モ" . "も"))
     ("mu" nil
      ("ム" . "む"))
     ("mya" nil
      ("ミャ" . "みゃ"))
     ("mye" nil
      ("ミェ" . "みぇ"))
     ("myi" nil
      ("ミィ" . "みぃ"))
     ("myo" nil
      ("ミョ" . "みょ"))
     ("myu" nil
      ("ミュ" . "みゅ"))
     ("n" nil
      ("ン" . "ん"))
     ("n'" nil
      ("ン" . "ん"))
     ("na" nil
      ("ナ" . "な"))
     ("ne" nil
      ("ネ" . "ね"))
     ("ni" nil
      ("ニ" . "に"))
     ("nn" nil
      ("ン" . "ん"))
     ("no" nil
      ("ノ" . "の"))
     ("nu" nil
      ("ヌ" . "ぬ"))
     ("nya" nil
      ("ニャ" . "にゃ"))
     ("nye" nil
      ("ニェ" . "にぇ"))
     ("nyi" nil
      ("ニィ" . "にぃ"))
     ("nyo" nil
      ("ニョ" . "にょ"))
     ("nyu" nil
      ("ニュ" . "にゅ"))
     ("o" nil
      ("オ" . "お"))
     ("pp" "p"
      ("ッ" . "っ"))
     ("pa" nil
      ("パ" . "ぱ"))
     ("pe" nil
      ("ペ" . "ぺ"))
     ("pi" nil
      ("ピ" . "ぴ"))
     ("po" nil
      ("ポ" . "ぽ"))
     ("pu" nil
      ("プ" . "ぷ"))
     ("pya" nil
      ("ピャ" . "ぴゃ"))
     ("pye" nil
      ("ピェ" . "ぴぇ"))
     ("pyi" nil
      ("ピィ" . "ぴぃ"))
     ("pyo" nil
      ("ピョ" . "ぴょ"))
     ("pyu" nil
      ("ピュ" . "ぴゅ"))
     ("rr" "r"
      ("ッ" . "っ"))
     ("ra" nil
      ("ラ" . "ら"))
     ("re" nil
      ("レ" . "れ"))
     ("ri" nil
      ("リ" . "り"))
     ("ro" nil
      ("ロ" . "ろ"))
     ("ru" nil
      ("ル" . "る"))
     ("rya" nil
      ("リャ" . "りゃ"))
     ("rye" nil
      ("リェ" . "りぇ"))
     ("ryi" nil
      ("リィ" . "りぃ"))
     ("ryo" nil
      ("リョ" . "りょ"))
     ("ryu" nil
      ("リュ" . "りゅ"))
     ("ss" "s"
      ("ッ" . "っ"))
     ("sa" nil
      ("サ" . "さ"))
     ("se" nil
      ("セ" . "せ"))
     ("sha" nil
      ("シャ" . "しゃ"))
     ("she" nil
      ("シェ" . "しぇ"))
     ("shi" nil
      ("シ" . "し"))
     ("sho" nil
      ("ショ" . "しょ"))
     ("shu" nil
      ("シュ" . "しゅ"))
     ("si" nil
      ("シ" . "し"))
     ("so" nil
      ("ソ" . "そ"))
     ("su" nil
      ("ス" . "す"))
     ("sya" nil
      ("シャ" . "しゃ"))
     ("sye" nil
      ("シェ" . "しぇ"))
     ("syi" nil
      ("シィ" . "しぃ"))
     ("syo" nil
      ("ショ" . "しょ"))
     ("syu" nil
      ("シュ" . "しゅ"))
     ("tt" "t"
      ("ッ" . "っ"))
     ("ta" nil
      ("タ" . "た"))
     ("te" nil
      ("テ" . "て"))
     ("tha" nil
      ("テァ" . "てぁ"))
     ("the" nil
      ("テェ" . "てぇ"))
     ("thi" nil
      ("ティ" . "てぃ"))
     ("tho" nil
      ("テョ" . "てょ"))
     ("thu" nil
      ("テュ" . "てゅ"))
     ("ti" nil
      ("チ" . "ち"))
     ("to" nil
      ("ト" . "と"))
     ("tsu" nil
      ("ツ" . "つ"))
     ("tu" nil
      ("ツ" . "つ"))
     ("tya" nil
      ("チャ" . "ちゃ"))
     ("tye" nil
      ("チェ" . "ちぇ"))
     ("tyi" nil
      ("チィ" . "ちぃ"))
     ("tyo" nil
      ("チョ" . "ちょ"))
     ("tyu" nil
      ("チュ" . "ちゅ"))
     ("u" nil
      ("ウ" . "う"))
     ("vv" "v"
      ("ッ" . "っ"))
     ("va" nil
      ("ヴァ" . "う゛ぁ"))
     ("ve" nil
      ("ヴェ" . "う゛ぇ"))
     ("vi" nil
      ("ヴィ" . "う゛ぃ"))
     ("vo" nil
      ("ヴォ" . "う゛ぉ"))
     ("vu" nil
      ("ヴ" . "う゛"))
     ("ww" "w"
      ("ッ" . "っ"))
     ("wa" nil
      ("ワ" . "わ"))
     ("we" nil
      ("ウェ" . "うぇ"))
     ("wi" nil
      ("ウィ" . "うぃ"))
     ("wo" nil
      ("ヲ" . "を"))
     ("wu" nil
      ("ウ" . "う"))
     ("xx" "x"
      ("ッ" . "っ"))
     ("xa" nil
      ("ァ" . "ぁ"))
     ("xe" nil
      ("ェ" . "ぇ"))
     ("xi" nil
      ("ィ" . "ぃ"))
     ("xka" nil
      ("ヵ" . "か"))
     ("xke" nil
      ("ヶ" . "け"))
     ("xo" nil
      ("ォ" . "ぉ"))
     ("xtsu" nil
      ("ッ" . "っ"))
     ("xtu" nil
      ("ッ" . "っ"))
     ("xu" nil
      ("ゥ" . "ぅ"))
     ("xwa" nil
      ("ヮ" . "ゎ"))
     ("xwe" nil
      ("ヱ" . "ゑ"))
     ("xwi" nil
      ("ヰ" . "ゐ"))
     ("xya" nil
      ("ャ" . "ゃ"))
     ("xyo" nil
      ("ョ" . "ょ"))
     ("xyu" nil
      ("ュ" . "ゅ"))
     ("yy" "y"
      ("ッ" . "っ"))
     ("ya" nil
      ("ヤ" . "や"))
     ("ye" nil
      ("イェ" . "いぇ"))
     ("yo" nil
      ("ヨ" . "よ"))
     ("yu" nil
      ("ユ" . "ゆ"))
     ("zz" "z"
      ("ッ" . "っ"))
     ("z " nil "　")
     ("z*" nil "※")
     ("z," nil "‥")
     ("z-" nil "〜")
     ("z." nil "…")
     ("z/" nil "・")
     ("z0" nil "○")
     ("z:" nil "゜")
     ("z;" nil "゛")
     ("z@" nil "◎")
     ("z[" nil "『")
     ("z]" nil "』")
     ("z{" nil "【")
     ("z}" nil "】")
     ("z(" nil "（")
     ("z)" nil "）")
     ("za" nil
      ("ザ" . "ざ"))
     ("ze" nil
      ("ゼ" . "ぜ"))
     ("zh" nil "←")
     ("zi" nil
      ("ジ" . "じ"))
     ("zj" nil "↓")
     ("zk" nil "↑")
     ("zl" nil "→")
     ("zL" nil "⇒")
     ("zo" nil
      ("ゾ" . "ぞ"))
     ("zu" nil
      ("ズ" . "ず"))
     ("zya" nil
      ("ジャ" . "じゃ"))
     ("zye" nil
      ("ジェ" . "じぇ"))
     ("zyi" nil
      ("ジィ" . "じぃ"))
     ("zyo" nil
      ("ジョ" . "じょ"))
     ("zyu" nil
      ("ジュ" . "じゅ"))
     ("." nil skk-auto-kutouten)
     ("," nil skk-auto-kutouten)
     ("-" nil skk-auto-kutouten)
     ("=" nil "-")
     (":" nil ":")
     (";" nil ";")
     ("?" nil "?")
     ("[" nil "[")
     ("]" nil "]")
     ("q" nil skk-toggle-kana)
     ("L" nil skk-jisx0208-latin-mode)
     ("Q" nil skk-set-henkan-point-subr)
     ("X" nil skk-purge-from-jisyo)
     ("/" nil skk-abbrev-mode)
     ("$" nil skk-display-code-for-char-at-point)
     ("@" nil skk-today)
     ("\\" nil skk-input-by-code-or-menu)
     (skk-kakutei-key nil skk-kakutei)
     ("ll" "l"
      ("ッ" . "っ"))
     ("la" nil
      ("ァ" . "ぁ"))
     ("li" nil
      ("ィ" . "ぃ"))
     ("lu" nil
      ("ゥ" . "ぅ"))
     ("le" nil
      ("ェ" . "ぇ"))
     ("lo" nil
      ("ォ" . "ぉ"))
     ("lyu" nil
      ("ュ" . "ゅ"))
     ("lya" nil
      ("ャ" . "ゃ"))
     ("lyo" nil
      ("ョ" . "ょ")))))
 '(skk-share-private-jisyo nil)
 '(skk-show-annotation nil)
 '(skk-show-candidates-always-pop-to-buffer nil)
 '(skk-show-icon nil)
 '(skk-show-inline nil)
 '(skk-show-japanese-menu nil)
 '(skk-show-tooltip nil)
 '(skk-status-indicator (quote minor-mode))
 '(skk-study-backup-file "~/.emacs.d/skk-files/.skk-study-u8.BAK")
 '(skk-study-file "~/.emacs.d/skk-files/.skk-study-u8")
 '(skk-study-sort-saving t)
 '(skk-use-color-cursor t)
 '(skk-use-face t)
 '(skk-use-jisx0201-input-method nil)
 '(skk-use-look nil)
 '(skk-use-numeric-conversion t)
 '(skk-verbose nil)
 '(yas-new-snippet-default
   "
# -*- mode: snippet -*-
# name $1
# key: ${2:${1:$(yas--key-from-desc yas-text)}}
# expand-env: ((yas/indent-line 'fixed) (yas/wrap-aroud-region 'nil))
# --
$0"))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
