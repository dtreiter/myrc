;;; PACKAGES:
;;; melpa (should probably use melpa-stable)
;;; evil
;;; evil-god-state
;;; acejump
;;; keychord
;;; helm
;;; projectile
;;; ack-and-a-half (rgrep seems to do this?)
;;; zenburn for gui emacs
;;; dirtree

(global-hl-line-mode 1) ;;; highlight line the cursor is on

;;; if gui emacs
(when (display-graphic-p)
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
    ;(load-theme 'zenburn t) ;;; zenburn emacs theme
    (load-theme 'tango t)
    (tool-bar-mode -1) ;;; only works in gui emacs. breaks in terminal
    (scroll-bar-mode -1)
    (set-face-attribute 'default nil :height 150) ;;; make font larger (15pt)
)
(when (not (display-graphic-p))
    (set-face-foreground 'hl-line nil)
    (set-face-foreground 'highlight nil)
    (set-face-background 'hl-line "black")

    ;;; set helm selection color
    (custom-set-variables)
    (custom-set-faces
	'(helm-selection ((t (:background "black" :underline t)))))
)

;;; show trailing whitespace
(setq show-trailing-whitespace t)
(setq-default indicate-empty-lines t)

;;; fix C-h backspace
(global-set-key (kbd "C-h") 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)

;;; remove menu bar
(menu-bar-mode -1)
(setq inhibit-startup-message t)

;;; enable line numbers
(require 'linum)
(global-linum-mode t)
(setq linum-format "%d ")

;;; Configure whitespace for tcl and rvt files
(add-to-list 'auto-mode-alist '("\\.\\(rvt\\|tcl\\)" . tcl-mode))
(defun my-tcl-tabs () (setq c-basic-offset 4) (setq tab-width 4) (setq indent-tabs-mode t))
(add-hook 'tcl-mode-hook 'my-tcl-tabs)

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

;;; Quick window transposing
(defun transpose-windows (arg)
   "Transpose the buffers shown in two windows."
   (interactive "p")
   (let ((selector (if (>= arg 0) 'next-window 'previous-window)))
     (while (/= arg 0)
       (let ((this-win (window-buffer))
             (next-win (window-buffer (funcall selector))))
         (set-window-buffer (selected-window) next-win)
         (set-window-buffer (funcall selector) this-win)
         (select-window (funcall selector)))
       (setq arg (if (plusp arg) (1- arg) (1+ arg))))))

;;; displays which function the cursor is in for the current buffer
(which-func-mode 1)

;;; enable org-mode and recommended shortcuts
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
;(setq org-log-done 'note)
(setq org-log-done t)

;;; add melpa to package list
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defun init-my-packages ()
    ;;; enable autocomplete
    (global-auto-complete-mode t)
    ;;; fuzzy file find
    (require 'projectile)
    (projectile-global-mode)
    ;;; vim-like key bindings
    (require 'evil)
    (evil-mode t)
    (require 'key-chord)
    (key-chord-mode 1)

    ;;; make ace jump only use lowercase
    ;;; (require 'cl)
    ;;; (setq ace-jump-mode-move-keys (loop for i from ?a to ?z collect i))

    ;;; some custom key shortcuts
    (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
    (key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
    (key-chord-define evil-normal-state-map ",m" 'save-buffer)
    (key-chord-define-global "ji" (kbd "RET"))
    (key-chord-define-global "nj" (kbd "C-g"))
    (key-chord-define-global "nh" (kbd "C-n"))
    (key-chord-define-global "hy" (kbd "C-p"))
    (key-chord-define-global "rf" 'other-window)
    (key-chord-define-global "tg" 'transpose-windows)
    (key-chord-define-global "mn" 'other-frame)

    (setq evil-search-module 'evil-search
	  evil-want-C-u-scroll t
	  evil-want-C-w-in-emacs-state t)

    ;;; custom evil mode shortcuts
    (define-key evil-normal-state-map (kbd "s") 'evil-execute-in-god-state)
    (evil-define-key 'god global-map [escape] 'evil-god-state-bail)
    (define-key evil-normal-state-map (kbd ";") 'helm-M-x)
    (define-key evil-normal-state-map (kbd ",f") 'projectile-find-file)
    (define-key evil-normal-state-map (kbd ",ak") 'ack-and-a-half)
    (define-key evil-normal-state-map (kbd ",t") 'dirtree)
    (define-key evil-normal-state-map (kbd ",b") 'helm-buffers-list)
    (define-key evil-normal-state-map (kbd ",ev") '(lambda () (interactive) (find-file "~/.emacs.d/init.el")))
    ;(define-key evil-normal-state-map (kbd ",n") 'next-buffer)
    ;(define-key evil-normal-state-map (kbd ",p") 'previous-buffer)
    (define-key evil-normal-state-map (kbd "SPC") 'evil-scroll-page-down)
    (define-key evil-normal-state-map (kbd "DEL") 'evil-scroll-page-up)
    (define-key evil-normal-state-map "f" 'ace-jump-word-mode)
    (define-key evil-visual-state-map "f" 'ace-jump-word-mode)
    (define-key evil-operator-state-map "f" 'ace-jump-word-mode)
    ;(define-key evil-normal-state-map (kbd "s") 'evil-search-forward)
    (define-key evil-normal-state-map (kbd "S") 'evil-search-backward)
    
    ;;; git shortcuts
    (define-key evil-normal-state-map (kbd ",gl") '(lambda () (interactive) (shell-command "git log -80")))
    (define-key evil-normal-state-map (kbd ",gs") '(lambda () (interactive) (shell-command "git status")))
    (define-key evil-normal-state-map (kbd ",gd") '(lambda () (interactive) (shell-command "git diff")))
    (define-key evil-normal-state-map (kbd ",gh") '(lambda () (interactive) (shell-command "git diff --cached")))

    ;;; nav tree
    (autoload 'dirtree "dirtree" "Add directory to tree view" t)

    ;;; nice file find
    (require 'ido)
    (ido-mode t)
    (setq ido-enable-flex-matching t)
    (setq ido-everywhere t)
    (ido-mode 1)

)

(init-my-packages) ;;; can be called manually if things get in the wrong state unexpectedly
