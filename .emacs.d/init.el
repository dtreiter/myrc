;;; fix C-h backspace
(setq show-trailing-whitespace t)
(setq-default indicate-empty-lines t)
(global-set-key [(control h)] 'delete-backward-char)

;;; highlight line the cursor is on
(global-hl-line-mode 1)
(set-face-foreground 'hl-line nil)
(set-face-foreground 'highlight nil)
(set-face-background 'hl-line "black")

;;; remove menu bar
(menu-bar-mode -1)

;;; enable line numbers
(require 'linum)
(global-linum-mode t)
(setq linum-format "%d ")

;;; enable mouse
(unless window-system
  (require 'mouse)
  (xterm-mouse-mode t)
  (global-set-key [mouse-4] '(lambda ()
                              (interactive)
                              (scroll-down 1)))
  (global-set-key [mouse-5] '(lambda ()
                              (interactive)
                              (scroll-up 1)))
  (defun track-mouse (e))
  (setq mouse-sel-mode t)
)

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
(require 'evil)
(evil-mode t)
(require 'key-chord)
(key-chord-mode 1)

;;; make ace jump only use lowercase
(require 'cl)
(setq ace-jump-mode-move-keys (loop for i from ?a to ?z collect i))

;;; some custom key shortcuts
(key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
(key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
(key-chord-define evil-normal-state-map ",m" 'save-buffer)

(setq evil-search-module 'evil-search
      evil-want-C-u-scroll t
      evil-want-C-w-in-emacs-state t)

(global-set-key (kbd "`") 'execute-extended-command)
(define-key evil-normal-state-map (kbd ";") 'evil-ex)
(define-key evil-normal-state-map (kbd ",f") 'ido-find-file)
(define-key evil-normal-state-map (kbd ",ak") 'ack-and-a-half)
(define-key evil-normal-state-map (kbd ",t") 'dirtree)
(define-key evil-normal-state-map (kbd ",ev") '(lambda () (interactive) (find-file "~/.emacs.d/init.el")))
(define-key evil-normal-state-map (kbd "]b") 'next-buffer)
(define-key evil-normal-state-map (kbd "[b") 'previous-buffer)
(define-key evil-normal-state-map (kbd "SPC") 'evil-scroll-page-down)
(define-key evil-normal-state-map (kbd "DEL") 'evil-scroll-page-up)
(define-key evil-normal-state-map "f" 'ace-jump-char-mode)
(define-key evil-visual-state-map "f" 'ace-jump-char-mode)
(define-key evil-operator-state-map "f" 'ace-jump-char-mode)

;;; esc quits
;;;(define-key evil-normal-state-map [escape] 'keyboard-quit)
;;;(define-key evil-visual-state-map [escape] 'keyboard-quit)
;;;(define-key minibuffer-local-map [escape] 'minibuffer-keyboard-quit)
;;;(define-key minibuffer-local-ns-map [escape] 'minibuffer-keyboard-quit)
;;;(define-key minibuffer-local-completion-map [escape] 'minibuffer-keyboard-quit)
;;;(define-key minibuffer-local-must-match-map [escape] 'minibuffer-keyboard-quit)
;;;(define-key minibuffer-local-isearch-map [escape] 'minibuffer-keyboard-quit)

;;; nav tree
(autoload 'dirtree "dirtree" "Add directory to tree view" t)

;;; fuzzy file find
(require 'ido)
(ido-mode t)
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
