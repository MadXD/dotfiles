;;;;
;;;; Packages
;;;;

(require 'package)

(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not (file-exists-p "~/.emacs.d/elpa"))
  (package-refresh-contents))

(dolist (pkg '(multiple-cursors
	       projectile
	       smex
	       yaml-mode))
  (when (not (package-installed-p pkg))
    (package-install pkg)))

;;;;
;;;; Config
;;;; 

(column-number-mode t)
(cua-mode t)
(electric-pair-mode t)
(global-auto-revert-mode t)
(global-hl-line-mode t)
(global-linum-mode t)
(invert-face 'default)
(menu-bar-mode -1)
(recentf-mode t)
(scroll-bar-mode -1)
(set-default 'truncate-lines t)
(tool-bar-mode -1)
(windmove-default-keybindings 'meta)

(ido-mode t)
(ido-everywhere t)

(global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-/") 'comment-or-uncomment-region)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C-S-p") 'smex)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)
(global-set-key (kbd "C-f") 'isearch-forward)
(global-set-key (kbd "C-p") 'projectile-find-file)
(global-set-key (kbd "C-s") 'save-buffer)
(setq auto-save-default nil)
(setq ido-enable-flex-matching t)
(setq linum-format "%4d \u2502")
(setq mac-command-modifier 'control)
(setq recentf-max-menu-items 250)
