;;; fix C-h backspace
(setq show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(global-set-key [(control h)] 'delete-backward-char)

;;; remove menu bar
(menu-bar-mode -1)

;;; enable mouse
(require 'mouse)
(xterm-mouse-mode t)
(defun track-mouse (e))
(setq mouse-sel-mode t)

;;; use elpa
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

;;; from purcell/emacs.d
(defun require-package (package &optional min-version no-refresh)
  "Install given PACKAGE, optionally requiring MIN-VERSION.
If NO-REFRESH is non-nil, the available package lists will not be
re-downloaded in order to locate PACKAGE."
  (if (package-installed-p package min-version)
      t
    (if (or (assoc package package-archive-contents) no-refresh)
        (package-install package)
      (progn
        (package-refresh-contents)
        (require-package package min-version t)))))

(package-initialize)

;;; vim-like key bindings
(require-package 'evil)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(require 'evil)
(evil-mode t)

(define-key evil-normal-state-map "f" 'ace-jump-char-mode)
;;;(define-key evil-normal-state-map "<backspace>" 'evil-scroll-page-up)
(define-key evil-visual-state-map "f" 'ace-jump-char-mode)
(define-key evil-visual-state-map ";" 'evil-ex)

;;; esc quits
(define-key evil-normal-state-map [escape] 'keyboard-quit)
(define-key evil-visual-state-map [escape] 'keyboard-quit)
(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;; nav tree
(autoload 'dirtree "dirtree" "Add directory to tree view" t)

;;; nice file find
(require 'ido)
(ido-mode t)
