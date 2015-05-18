(require 'server)

(when (not (server-running-p))
  (server-start))

;;;;
;;;; Packages
;;;;

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not (file-exists-p "~/.emacs.d/elpa"))
  (package-refresh-contents))

(dolist (pkg '(ag
               comment-dwim-2
               fish-mode
               flx-ido
;               flycheck
               go-mode
               ido-ubiquitous
               ido-vertical-mode
               jade-mode
               markdown-mode
               monokai-theme
               multiple-cursors
               powershell
               projectile
               sass-mode
               scss-mode
               smart-mode-line
               smex
               yaml-mode))
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;;;;
;;;; UI
;;;;

(defalias 'yes-or-no-p 'y-or-n-p)

(let ((font-families (font-family-list)))
  (cond
   ((member "Inconsolata" (font-family-list))
    (set-frame-font "Inconsolata-14"))
   ((member "Menlo" (font-family-list))
    (set-frame-font "Menlo-12"))
   ((member "Ubuntu Mono" (font-family-list))
    (set-frame-font "Ubuntu-Mono-12"))))

;;;;
;;;; Config
;;;;

(windmove-default-keybindings 'meta)

(load "~/.emacs.d/cua-modern-mode.el")
(load "~/.emacs.d/unifmt.el")

(global-set-key (kbd "C-/") 'comment-dwim-2)
(global-set-key (kbd "C-M-f") 'projectile-ag)
(global-set-key (kbd "C-S-d") 'duplicate-line-or-region)
(global-set-key (kbd "C-S-k") 'kill-whole-line)
(global-set-key (kbd "C-S-p") 'smex)
(global-set-key (kbd "C-S-w") 'delete-frame)
(global-set-key (kbd "C-c o") 'multi-occur)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-g") 'keyboard-escape-quit)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-p") 'projectile-find-file)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)

(add-hook 'after-init-hook 'sml/setup)
(add-hook 'focus-out-hook 'save-all-modified-buffers)

;;;
;;; Funcs
;;;

(defun save-all-modified-buffers ()
  (interactive)
  (save-some-buffers t))

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(load-file "~/Development/flycheck/flycheck.el")

(defun duplicate-line-or-region (&optional n)
      "Duplicate current line, or region if active.
    With argument N, make N copies.
    With negative N, comment out original line and use the absolute value."
      (interactive "*p")
      (let ((use-region (use-region-p)))
        (save-excursion
          (let ((text (if use-region        ;Get region if active, otherwise line
                          (buffer-substring (region-beginning) (region-end))
                        (prog1 (thing-at-point 'line)
                          (end-of-line)
                          (if (< 0 (forward-line 1)) ;Go to beginning of next line, or make a new one
                              (newline))))))
            (dotimes (i (abs (or n 1)))     ;Insert N times, or once if not specified
              (insert text))))
        (if use-region nil                  ;Only if we're working with a line (not a region)
          (let ((pos (- (point) (line-beginning-position)))) ;Save column
            (if (> 0 n)                             ;Comment out original with negative arg
                (comment-region (line-beginning-position) (line-end-position)))
            (forward-line 1)
            (forward-char pos)))))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(hl-line ((t (:inherit t :background "#464538"))))
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face))))
 '(mode-line ((t (:background "#4C4B3C" :foreground "#F8F8F2" :inverse-video nil :box (:line-width 1 :color "#3E3D31" :style unspecified)))))
 '(mode-line-inactive ((t (:background "#1a1a1a" :foreground "#75715E" :inverse-video nil :box (:line-width 1 :color "#3E3D31" :style unspecified)))))
 '(region ((t (:inherit t :background "#727161")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p sml/generate-buffer-identification unifmt-after-save)))
 '(auto-save-default nil)
 '(before-save-hook
   (quote
    (copyright-update time-stamp delete-trailing-whitespace)))
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("9466b961ad4f8d521b33b0f2a65405e389f1dba1db1a4b25f91797f3d1a11b53" "8aebf25556399b58091e533e455dd50a6a9cba958cc4ebb0aab175863c25b9a4" "c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "monokai")))
 '(default-frame-alist
    (quote
     ((vertical-scroll-bars)
      (height . 50)
      (width . 150))))
 '(echo-keystrokes 1e-05)
 '(electric-indent-mode t)
 '(electric-pair-mode t)
 '(fill-column 78)
 '(flx-ido-mode t)
 '(flycheck-checkers
   (quote
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck haml handlebars haskell-ghc haskell-hlint html-tidy javascript-standard javascript-jshint javascript-eslint javascript-gjslint javascript-jscs json-jsonlint less luacheck lua perl perl-perlcritic php php-phpmd php-phpcs puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint rst rst-sphinx ruby-rubocop ruby-rubylint ruby ruby-jruby rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim tex-chktex tex-lacheck texinfo verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(gc-cons-threshold 20000000)
 '(global-auto-revert-mode t)
 '(global-flycheck-mode t)
 '(global-hl-line-mode t)
 '(global-linum-mode t)
 '(gofmt-command "goimports")
 '(ido-create-new-buffer (quote always))
 '(ido-everywhere t)
 '(ido-mode (quote both) nil (ido))
 '(ido-use-faces nil)
 '(ido-use-filename-at-point (quote guess))
 '(ido-vertical-mode t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-echo-area-message "lvillani")
 '(inhibit-startup-screen t)
 '(ispell-highlight-face (quote flyspell-incorrect))
 '(ispell-program-name "/usr/local/bin/ispell")
 '(js-indent-level 2)
 '(kill-whole-line t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(mouse-wheel-scroll-amount (quote (1)))
 '(ns-command-modifier (quote control))
 '(projectile-global-mode t)
 '(recentf-mode t)
 '(require-final-newline t)
 '(rm-blacklist "\\(b-loc\\|fixm\\|FlyC\\|Projectile\\).*")
 '(scroll-bar-mode nil)
 '(scroll-margin 5)
 '(scroll-step 1)
 '(sgml-basic-offset 4)
 '(show-paren-delay 0)
 '(show-paren-mode t)
 '(sml/theme (quote respectful))
 '(tab-width 4)
 '(text-mode-hook (quote (turn-on-flyspell text-mode-hook-identify)))
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(user-full-name "Lorenzo Villani")
 '(user-mail-address "lorenzo@villani.me")
 '(vc-follow-symlinks t)
 '(warning-minimum-level :emergency)
 '(writeroom-global-effects
   (quote
    (writeroom-toggle-fullscreen writeroom-toggle-alpha writeroom-toggle-menu-bar-lines writeroom-toggle-tool-bar-lines writeroom-toggle-vertical-scroll-bars writeroom-toggle-internal-border-width))))
