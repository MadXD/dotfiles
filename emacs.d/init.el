;;;;
;;;; Packages
;;;;

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not (file-exists-p "~/.emacs.d/elpa"))
  (package-refresh-contents))

(dolist (pkg '(fish-mode
               flx-ido
               flycheck
               go-mode
               jade-mode
               markdown-mode
               monokai-theme
               multiple-cursors
               powershell
               projectile
               sass-mode
               scss-mode
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

(global-set-key (kbd "<end>") 'end-of-line)
(global-set-key (kbd "<home>") 'beginning-of-line)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-S-p") 'smex)
(global-set-key (kbd "C-d") 'mc/mark-next-like-this)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-p") 'projectile-find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(global-set-key (kbd "C-x C-r") 'ido-recentf-open)
(global-set-key (kbd "RET") 'newline-and-indent)
(setq-default mac-command-modifier 'control)
(setq-default recentf-max-menu-items 100)

(defun ido-recentf-open ()
  "Use `ido-completing-read' to \\[find-file] a recent file"
  (interactive)
  (if (find-file (ido-completing-read "Find recent file: " recentf-list))
      (message "Opening file...")
    (message "Aborting")))

(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(markdown-header-face-1 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-2 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-3 ((t (:inherit markdown-header-face :height 1.0))))
 '(markdown-header-face-4 ((t (:inherit markdown-header-face)))))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-save-default nil)
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (monokai)))
 '(custom-safe-themes
   (quote
    ("a041a61c0387c57bb65150f002862ebcfe41135a3e3425268de24200b82d6ec9" "monokai")))
 '(echo-keystrokes 0.001)
 '(electric-pair-mode t)
 '(fill-column 78)
 '(gc-cons-threshold 20000000)
 '(global-linum-mode t)
 '(gofmt-command "goimports")
 '(ido-everywhere t)
 '(indent-tabs-mode nil)
 '(inhibit-startup-echo-area-message "lvillani")
 '(inhibit-startup-screen t)
 '(make-backup-files nil)
 '(menu-bar-mode nil)
 '(require-final-newline t)
 '(scroll-bar-mode nil)
 '(scroll-margin 5)
 '(scroll-step 1)
 '(show-paren-delay 0)
 '(tab-width 4)
 '(tool-bar-mode nil)
 '(truncate-lines t)
 '(user-full-name "Lorenzo Villani")
 '(user-mail-address "lorenzo@villani.me")
 '(vc-follow-symlinks t))
