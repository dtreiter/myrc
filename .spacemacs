;; -*- mode: emacs-lisp -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Configuration Layers declaration."
  (setq-default
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load. If it is the symbol `all' instead
   ;; of a list then all discovered layers will be installed.
   dotspacemacs-configuration-layers
   '(
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press <SPC f e R> (Vim style) or
     ;; <M-m f e R> (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     auto-completion
     ;; better-defaults
     emacs-lisp
     ;;git
     ;; markdown
     ;; org
     ;; (shell :variables
     ;;        shell-default-height 30
     ;;        shell-default-position 'bottom)
     ;; syntax-checking
     version-control
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages then consider to create a layer, you can also put the
   ;; configuration in `dotspacemacs/config'.
   dotspacemacs-additional-packages '(ac-helm)
   ;; A list of packages and/or extensions that will not be install and loaded.
   dotspacemacs-excluded-packages '(smartparens)
   ;; If non-nil spacemacs will delete any orphan packages, i.e. packages that
   ;; are declared in a layer which is not a member of
   ;; the list `dotspacemacs-configuration-layers'
   dotspacemacs-delete-orphan-packages nil))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration."
  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; Either `vim' or `emacs'. Evil is always enabled but if the variable
   ;; is `emacs' then the `holy-mode' is enabled at startup.
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer.
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed.
   dotspacemacs-startup-banner nil
   ;; List of items to show in the startup buffer. If nil it is disabled.
   ;; Possible values are: `recents' `bookmarks' `projects'."
   dotspacemacs-startup-lists '(recents projects)
   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press <SPC> T n to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(zenburn
                         solarized-light
                         ;solarized-dark
                         ;spacemacs-light
                         ;spacemacs-dark
                         ;leuven
                         monokai
                         )
   ;; If non nil the cursor color matches the state color.
   dotspacemacs-colorize-cursor-according-to-state t
   ;; Default font. `powerline-scale' allows to quickly tweak the mode-line
   ;; size to make separators look not too crappy.
   dotspacemacs-default-font '("Monaco"
                               :size 15
                               :weight normal
                               :width normal
                               :powerline-scale 1.1)
   ;; The leader key
   dotspacemacs-leader-key "SPC"
   ;; The leader key accessible in `emacs state' and `insert state'
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it.
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; The command key used for Evil commands (ex-commands) and
   ;; Emacs commands (M-x).
   ;; By default the command key is `:' so ex-commands are executed like in Vim
   ;; with `:' and Emacs commands are executed with `<leader> :'.
   dotspacemacs-command-key ":"
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; Default value is `cache'.
   dotspacemacs-auto-save-file-location 'cache
   ;; If non nil then `ido' replaces `helm' for some commands. For now only
   ;; `find-files' (SPC f f) is replaced.
   dotspacemacs-use-ido nil
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content.
   dotspacemacs-enable-paste-micro-state nil
   ;; Guide-key delay in seconds. The Guide-key is the popup buffer listing
   ;; the commands bound to the current keystrokes.
   dotspacemacs-guide-key-delay 0.8
   ;; If non nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil ;; to boost the loading time.
   dotspacemacs-loading-progress-bar t
   ;; If non nil the frame is fullscreen when Emacs starts up.
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil
   ;; If non nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX."
   dotspacemacs-fullscreen-use-non-native nil
   ;; If non nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-active-transparency 90
   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'.
   dotspacemacs-inactive-transparency 90
   ;; If non nil unicode symbols are displayed in the mode line.
   dotspacemacs-mode-line-unicode-symbols nil
   ;; If non nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters the
   ;; point when it reaches the top or bottom of the screen.
   dotspacemacs-smooth-scrolling t
   ;; If non-nil smartparens-strict-mode will be enabled in programming modes.
   dotspacemacs-smartparens-strict-mode nil
   ;; Select a scope to highlight delimiters. Possible value is `all',
   ;; `current' or `nil'. Default is `all'
   dotspacemacs-highlight-delimiters 'all
   ;; If non nil advises quit functions to keep server open when quitting.
   dotspacemacs-persistent-server nil
   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `ag', `pt', `ack' and `grep'.
   dotspacemacs-search-tools '("ag" "pt" "ack" "grep")
   ;; The default package repository used if no explicit repository has been
   ;; specified with an installed package.
   ;; Not used for now.
   dotspacemacs-default-package-repository nil
   )
  ;; User initialization goes here
  )

(defun dotspacemacs/config ()
  "Configuration function.
 This function is called at the very end of Spacemacs initialization after
layers configuration."
  ;; fix C-h backspace
  (global-set-key (kbd "C-h") 'delete-backward-char)
  (keyboard-translate ?\C-h ?\C-?)

  ;; No ~ backup files
  (setq make-backup-files nil)

  ;; Make powerline look better
  (setq powerline-default-separator nil)

  ;; Line numbers
  (setq linum-format "%d ")
  (global-linum-mode)

  ;; Turn off persistent search highlighting
  (global-evil-search-highlight-persist -1)

  (toggle-transparency)

  ;; Turn off default text in helm swoop
  (setq helm-swoop-pre-input-function (lambda () nil))

  (define-key evil-normal-state-map "f" 'ace-jump-word-mode)
  (define-key evil-visual-state-map "f" 'ace-jump-word-mode)
  (define-key evil-operator-state-map "f" 'ace-jump-word-mode)

  ;; Move through wrapped lines
  (define-key evil-normal-state-map (kbd "j") 'evil-next-visual-line)
  (define-key evil-normal-state-map (kbd "k") 'evil-previous-visual-line)

  ;; Make s enter custom view-mode
  (define-key evil-normal-state-map (kbd "s") 'me/view-mode-enable)

  ;; Configure whitespace for tcl and rvt files
  (add-to-list 'auto-mode-alist '("\\.\\(rvt\\|tcl\\|test\\)" . tcl-mode))
  (defun my-tcl-tabs ()
    (setq c-basic-offset 4)
    (setq tab-width 4)
    (setq indent-tabs-mode t)
    (setq default-tab-width 4))
  (add-hook 'tcl-mode-hook 'my-tcl-tabs)
  (add-hook 'js-mode-hook 'my-tcl-tabs)

  ;; Add clear function to eshell
  (defun eshell/clear ()
    "Clear the eshell buffer."
    (let ((inhibit-read-only t))
      (erase-buffer)
      (eshell-send-input)))

  (require 'org)
  (define-key global-map "\C-cl" 'org-store-link)
  (define-key global-map "\C-ca" 'org-agenda)
  (setq org-log-done t)

  ;; Temporary tramp work-around
  (defadvice vc-registered (around my-vc-svn-registered-tramp activate)
    "Don't try to use SVN on files accessed via TRAMP."
    (if (and (fboundp 'tramp-tramp-file-p)
             (tramp-tramp-file-p (ad-get-arg 0)))
        nil
      ad-do-it))

  ;; Keep autosave from misbehaving over tramp
  (setq tramp-auto-save-directory "/tmp")

  ;; Git wrappers
  (defun git-log ()
    (interactive)
    (shell-command "git --no-pager log -80"))

  (defun git-show ()
    (interactive)
    (shell-command (concat "git --no-pager show " (thing-at-point 'word))))

  ;; TODO buffer-file-name doesn't work over tramp
  (defun git-blame ()
    (interactive)
    (shell-command (concat "git --no-pager blame " (buffer-file-name))))

  (defun git-status ()
    (interactive)
    (shell-command "git --no-pager status"))

  (defun git-diff ()
    (interactive)
    (shell-command "git --no-pager diff"))

  (defun git-diff-cached ()
    (interactive)
    (shell-command "git --no-pager diff --cached"))

  (defun git-checkout ()
    (interactive)
    (shell-command (concat "git checkout " (thing-at-point 'word))))

  (defun me/yank-to-register (beg end register)
    "Yank a selection to a given register"
    (interactive "r\nsRegister: ")
    (when (evil-visual-state-p)
      (evil-exit-visual-state)
      (let ((selection (regexp-quote (buffer-substring-no-properties beg end))))
        (evil-set-register (string-to-char register) selection))))

  (defun me/view-mode-enable ()
    "Enable view-mode from evil"
    (interactive)
    (evil-emacs-state)
    (let ((current-prefix-arg '(4)))
      (call-interactively 'view-mode)))

  (defun me/layout-double-columns ()
    "Set the layout to double columns."
    (interactive)
    (delete-other-windows)
    (spacemacs/alternate-buffer)
    (split-window-right)
    (spacemacs/alternate-buffer)
    (balance-windows))

  (defun me/view-mode-config ()
    "Add lots of custom shortcuts to view-mode"
    (define-key view-mode-map (kbd "q")
      (lambda ()
        (interactive)
        (View-exit)
        (evil-exit-emacs-state)))
    (define-key view-mode-map (kbd "a") #'spacemacs/alternate-buffer)
    (define-key view-mode-map (kbd "b") #'evil-scroll-page-up)
    (define-key view-mode-map (kbd "c") #'delete-window)
    (define-key view-mode-map (kbd "d") #'evil-scroll-down)
    (define-key view-mode-map (kbd "e") #'evil-goto-line)
    (define-key view-mode-map (kbd "f") #'evil-scroll-page-down)
    (define-key view-mode-map (kbd "F") #'ace-jump-word-mode)
    (define-key view-mode-map (kbd "g") #'evil-goto-first-line)
    (define-key view-mode-map (kbd "G") #'spacemacs/git-micro-state)
    (define-key view-mode-map (kbd "i") #'evil-jumper/forward)
    (define-key view-mode-map (kbd "l") #'helm-buffers-list)
    (define-key view-mode-map (kbd "m") #'evil-window-middle)
    (define-key view-mode-map (kbd "n") #'spacemacs/next-useful-buffer)
    (define-key view-mode-map (kbd "o") #'evil-jumper/backward)
    (define-key view-mode-map (kbd "p") #'spacemacs/previous-useful-buffer)
    (define-key view-mode-map (kbd "r") #'rotate-windows)
    (define-key view-mode-map (kbd "s") #'helm-swoop)
    (define-key view-mode-map (kbd "S") #'split-window-below-and-focus)
    (define-key view-mode-map (kbd "t") #'evil-scroll-line-to-top)
    (define-key view-mode-map (kbd "u") #'evil-scroll-up)
    (define-key view-mode-map (kbd "v") #'split-window-right-and-focus)
    (define-key view-mode-map (kbd "w") #'other-window)
    (define-key view-mode-map (kbd "y") #'other-frame)
    (define-key view-mode-map (kbd "z") #'evil-scroll-line-to-center)
    (define-key view-mode-map (kbd "/") 'isearch-forward-regexp))

  (add-hook 'view-mode-hook #'me/view-mode-config)

  (spacemacs|define-micro-state git
    :doc "Git micro-state"
    :execute-binding-on-enter t
    :evil-leader "gg"
    :bindings
    ("b" git-blame)
    ("d" git-diff)
    ("h" git-diff-cached)
    ("l" git-log)
    ("s" git-status)
    ("w" git-show))

  ;; Custom leader bindings
  (evil-leader/set-key
    "<SPC>" #'evil-scroll-page-down
    ";"  #'helm-M-x
    "bv" #'me/view-mode-enable
    "d"  #'evil-scroll-page-up
    "ff" #'ido-find-file
    "fw" #'ido-write-file
    "gl" #'git-log
    "gw" #'git-show
    "gb" #'git-blame
    "gs" #'git-status
    "gd" #'git-diff
    "gh" #'git-diff-cached
    "ir" #'indent-region
    "sr" #'grep-graceful
    "mx" #'execute-extended-command
    "oa" #'org-agenda
    "oi" #'org-clock-in
    "oo" #'org-clock-out
    "ot" #'org-todo
    "os" #'org-schedule
    "oc" #'org-cycle
    "or" #'org-ctrl-c-ctrl-c
    "pf" #'search-filetree ; Override projectile for use on graceful
    "st" #'helm-etags-select
    "yr" #'me/yank-to-register
    "w2" #'my-own/layout-double-columns
    "ev" (lambda () (interactive) (find-file "~/.spacemacs"))
  )
)

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
  ;;; Specify agenda files
  ;'(org-agenda-files (quote ("~/org"))))

 ; Tell execute-extended-command not to use helm
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (trace-function . helm-completing-read-symbols)
     (trace-function-foreground . helm-completing-read-symbols)
     (trace-function-background . helm-completing-read-symbols)
     (find-tag . helm-completing-read-with-cands-in-buffer)
     (ffap-alternate-file)
     (tmm-menubar)
     (execute-extended-command)))))
