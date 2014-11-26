;;; PACKAGES:
;;; melpa (should probably use melpa-stable)
;;; evil
;;; evil-god-state
;;; acejump
;;; keychord
;;; helm
;;; projectile
;;; helm-projectile
;;; ack-and-a-half
;;; zenburn for gui emacs
;;; dirtree
;;; should add some sort of git client

;;; if gui emacs
(when (display-graphic-p)
    (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
    (load-theme 'zenburn t) ;;; zenburn emacs theme
    (tool-bar-mode -1) ;;; only works in gui emacs. breaks in terminal
    (scroll-bar-mode -1)
    (set-face-attribute 'default nil :height 150) ;;; make font larger (15pt)
)

;;; show trailing whitespace
(setq show-trailing-whitespace t)
(setq-default indicate-empty-lines t)

;;; fix C-h backspace
(global-set-key (kbd "C-h") 'delete-backward-char)
(keyboard-translate ?\C-h ?\C-?)

;;; highlight line the cursor is on
(global-hl-line-mode 1)
(set-face-foreground 'hl-line nil)
(set-face-foreground 'highlight nil)
(set-face-background 'hl-line "black")

;;; remove menu bar
(menu-bar-mode -1)
(setq inhibit-startup-message t)

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

;;; add melpa to package list
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.milkbox.net/packages/") t)

(package-initialize)

(defun init-my-packages ()
    ;;; enable autocomplete
    (global-auto-complete-mode t)
    ;;; fuzzy file find
    ;(require 'projectile)
    ;;; vim-like key bindings
    (require 'evil)
    (evil-mode t)
    (require 'key-chord)
    (key-chord-mode 1)
    ;(require 'helm-projectile)
    ;(projectile-global-mode)
    ;(setq projectile-completion-system 'helm)

    ;;; make ace jump only use lowercase
    ;;; (require 'cl)
    ;;; (setq ace-jump-mode-move-keys (loop for i from ?a to ?z collect i))

    ;;; some custom key shortcuts
    (key-chord-define evil-insert-state-map "jk" 'evil-normal-state)
    (key-chord-define evil-visual-state-map "jk" 'evil-normal-state)
    (key-chord-define evil-normal-state-map ",m" 'save-buffer)
    (key-chord-define-global "ji" (kbd "RET"))
    (key-chord-define-global "hu" (kbd "TAB"))
    (key-chord-define-global "nj" (kbd "C-g"))
    (key-chord-define-global "nh" (kbd "C-n"))
    (key-chord-define-global "hy" (kbd "C-p"))
    (key-chord-define-global "rf" 'other-window)

    (setq evil-search-module 'evil-search
	  evil-want-C-u-scroll t
	  evil-want-C-w-in-emacs-state t)

    ;;; custom evil mode shortcuts
    (define-key evil-normal-state-map (kbd ";") 'helm-M-x)
    (define-key evil-normal-state-map (kbd ",f") 'find-file)
    (define-key evil-normal-state-map (kbd ",ak") 'ack-and-a-half)
    (define-key evil-normal-state-map (kbd ",t") 'dirtree)
    (define-key evil-normal-state-map (kbd ",b") 'helm-buffers-list)
    (define-key evil-normal-state-map (kbd ",ev") '(lambda () (interactive) (find-file "~/.emacs.d/init.el")))
    (define-key evil-normal-state-map (kbd "]b") 'next-buffer)
    (define-key evil-normal-state-map (kbd "gx") 'helm-M-x)
    (define-key evil-normal-state-map (kbd "[b") 'previous-buffer)
    (define-key evil-normal-state-map (kbd "SPC") 'evil-scroll-page-down)
    (define-key evil-normal-state-map (kbd "DEL") 'evil-scroll-page-up)
    (define-key evil-normal-state-map "f" 'ace-jump-char-mode)
    (define-key evil-visual-state-map "f" 'ace-jump-char-mode)
    (define-key evil-operator-state-map "f" 'ace-jump-char-mode)
    ;;; evil god mode
    (evil-define-key 'normal global-map "\\" 'evil-execute-in-god-state)
    (evil-define-key 'god global-map [escape] 'evil-god-state-bail)

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
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(helm-selection ((t (:background "black" :underline t)))))
