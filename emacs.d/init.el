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
               fish-mode
               flx-ido
               flycheck
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

(cond
 ((member "Inconsolata" (font-family-list))
  (set-frame-font "Inconsolata-12"))
 ((member "Menlo" (font-family-list))
  (set-frame-font "Menlo-12"))
 ((member "Ubuntu Mono" (font-family-list))
  (set-frame-font "Ubuntu-Mono-12")))

;;;;
;;;; Config
;;;;

(windmove-default-keybindings 'meta)

(global-set-key (kbd "C-S-p") 'smex)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-o") 'find-file)
(global-set-key (kbd "C-p") 'projectile-find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "M-;") 'comment-dwim-2)

(defun save-all-modified-buffers ()
  (interactive)
  (save-some-buffers t))

(add-hook 'after-init-hook 'sml/setup)
(add-hook 'focus-out-hook 'save-all-modified-buffers)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(require 'flycheck)
(flycheck-define-checker javascript-standard
  "A Python syntax and style checker using standard"
  :command ("standard" source)
  :error-patterns ((error line-start "  " (file-name) ":" line ":" column ":" (message) line-end))
  :modes js-mode)

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
 '(region ((t (:inherit t :background "#727161")))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(after-save-hook
   (quote
    (executable-make-buffer-file-executable-if-script-p)))
 '(auto-save-default nil)
 '(before-save-hook
   (quote
    (copyright-update time-stamp delete-trailing-whitespace)))
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("c74e83f8aa4c78a121b52146eadb792c9facc5b1f02c917e3dbb454fca931223" "a27c00821ccfd5a78b01e4f35dc056706dd9ede09a8b90c6955ae6a390eb1c1e" "3c83b3676d796422704082049fc38b6966bcad960f896669dfc21a7a37a748fa" "a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "monokai")))
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
    (ada-gnat asciidoc c/c++-clang c/c++-gcc c/c++-cppcheck cfengine chef-foodcritic coffee coffee-coffeelint coq css-csslint d-dmd elixir emacs-lisp emacs-lisp-checkdoc erlang eruby-erubis fortran-gfortran go-gofmt go-golint go-vet go-build go-test go-errcheck haml handlebars haskell-ghc haskell-hlint html-tidy javascript-standard javascript-jshint javascript-eslint javascript-gjslint json-jsonlint less luacheck lua perl perl-perlcritic php php-phpmd php-phpcs puppet-parser puppet-lint python-flake8 python-pylint python-pycompile r-lintr racket rpm-rpmlint rst rst-sphinx ruby-rubocop ruby-rubylint ruby ruby-jruby rust sass scala scala-scalastyle scss-lint scss sh-bash sh-posix-dash sh-posix-bash sh-zsh sh-shellcheck slim tex-chktex tex-lacheck texinfo verilog-verilator xml-xmlstarlet xml-xmllint yaml-jsyaml yaml-ruby)))
 '(gc-cons-threshold 20000000)
 '(global-auto-revert-mode t)
 '(global-fixmee-mode t)
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
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(user-full-name "Lorenzo Villani")
 '(user-mail-address "lorenzo@villani.me")
 '(vc-follow-symlinks t)
 '(warning-minimum-level :emergency))
