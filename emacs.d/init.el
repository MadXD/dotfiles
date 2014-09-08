;;; sublimacs.el -- Emacs meets Sublime Text
;;;
;;; Copyright (C) 2014 Lorenzo Villani.
;;;
;;; This file is not part of GNU Emacs.
;;;
;;; This program is free software; you can redistribute it and/or modify
;;; it under the terms of the GNU General Public License as published by
;;; the Free Software Foundation; version 3 of the License.
;;;
;;; This program is distributed in the hope that it will be useful,
;;; but WITHOUT ANY WARRANTY; without even the implied warranty of
;;; MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
;;; GNU General Public License for more details.
;;;
;;; You should have received a copy of the GNU General Public License
;;; along with this program; if not, write to the Free Software
;;; Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
;;;
;;; Code:

(unless (and (>= 24 emacs-major-version) (>= 3 emacs-minor-version))
    (error "Sublimacs requires Emacs 24.3 or later"))

;;
;; UI
;;

(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 160))
(fset 'yes-or-no-p 'y-or-n-p)
(load-theme 'monokai t)
(menu-bar-mode -1)
(scroll-bar-mode -1)
(tool-bar-mode -1)

(cond
 ((string-equal system-type "darwin")
  (set-frame-font "Menlo-12"))
 ((string-equal system-type "gnu/linux")
  (if (find-font (font-spec :name "Ubuntu Mono"))
          (set-frame-font "Ubuntu Mono-12")
      (set-frame-font "Monospace-12")))
 ((string-equal system-type "windows-nt")
  (set-frame-font "Inconsolata-12")))

;;
;; Global
;;

(require 'uniquify)

;; Don't make backup files
(setq make-backup-files nil)
(setq backup-inhibited t)
(setq auto-save-default nil)

;; UTF-8 everywhere!
(prefer-coding-system 'utf-8)
(set-default-coding-systems 'utf-8)
(set-language-environment 'utf-8)
(set-selection-coding-system 'utf-8)
(set-terminal-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)
(setq locale-coding-system 'utf-8)

;; General
(setq clean-buffer-list-delay-general 1)
(setq clean-buffer-list-delay-special (* 5 60))
(setq clean-buffer-list-kill-regexps '("\\*.+\\*"))
(setq compilation-read-command nil)
(setq echo-keystrokes 0.01)
(setq frame-title-format '("%f - " user-real-login-name "@" system-name))
(setq gc-cons-threshold 20000000)
(setq indent-tabs-mode nil)
(setq inhibit-startup-message t)
(setq lisp-body-indent 4)
(setq require-final-newline t)
(setq ring-bell-function 'ignore)
(setq tab-width 4)
(setq truncate-lines t)
(setq truncate-partial-width-windows nil)
(setq uniquify-buffer-name-style 'post-forward)
(setq visible-bell t)

(setq-default cursor-type 'box)
(setq-default fill-column 98)
(setq-default indent-tabs-mode nil)
(setq-default truncate-lines t)

;; Scrolling
(setq auto-window-vscroll nil)
(setq mouse-wheel-follow-mouse 't)
(setq mouse-wheel-progressive-speed nil)
(setq mouse-wheel-scroll-amount '(3 ((shift) . 3)))
(setq scroll-conservatively 10000)
(setq scroll-margin 5)
(setq scroll-step 1)

;; Use Command instead of Ctrl and make it possible to combine characters with right Option key.
(when (string-equal system-type "darwin")
    (setq ns-command-modifier 'control)
    (setq ns-right-option-modifier nil))

;;
;; Packages
;;

(require 'package)

(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))

(package-initialize)

(when (not (file-exists-p package-user-dir))
    (package-refresh-contents))

(dolist (pkg '(ag
               auto-complete
               batch-mode
               clang-format
               coffee-mode
               cython-mode
               duplicate-thing
               editorconfig
               fish-mode
               fixmee
               flx-ido
               flycheck
               git-commit-mode
               go-mode
               ido-ubiquitous
               ido-vertical-mode
               js2-mode
               json-mode
               markdown-mode
               multiple-cursors
               nyan-mode
               powershell-mode
               projectile
               rich-minority
               smart-mode-line
               smartparens
               smex
               web-mode
               yaml-mode))
    (when (not (package-installed-p pkg))
        (package-install pkg)))

;;
;; Minor Modes
;;

(column-number-mode t)
(cua-mode t)
(global-auto-revert-mode t)
(global-fixmee-mode t)
(global-flycheck-mode t)
(global-hl-line-mode t)
(line-number-mode t)
(line-number-mode t)
(nyan-mode t)
(projectile-global-mode t)
(recentf-mode t)
(rich-minority-mode t)
(show-paren-mode t)
(smartparens-global-mode t)
(smex-initialize)
(transient-mark-mode t)
;; (global-linum-mode t)

(setq cua-prefix-override-inhibit-delay 0.01)
(setq flycheck-check-syntax-automatically '(mode-enabled save))
(setq linum-format "%4d ")
(setq nyan-bar-length 10)
(setq recentf-max-saved-items 1000)
(setq rm-whitelist '(""))
(setq show-paren-delay 0)

;;
;; Smart ModeLine
;;

(setq sml/no-confirm-load-theme t)

(sml/setup)
(sml/apply-theme 'respectful)

;;
;; Auto Complete
;;

(ac-config-default)
(ac-set-trigger-key "TAB")

(setq ac-auto-start nil)

;;
;; Spell Checker
;;

(when (or (file-executable-p "/usr/local/bin/aspell") (file-executable-p "/usr/bin/aspell"))
    (require 'ispell)

    (setq ispell-program-name "aspell")
    (setq ispell-extra-args '("--lang=en_US" "--run-together" "--run-together-limit=5" "--run-together-min=2" "--sug-mode=ultra"))

    (add-hook 'prog-mode-hook 'flyspell-prog-mode)
    (add-hook 'text-mode-hook 'flyspell-mode))

;;
;; IDO
;;

(ido-mode t)
(ido-everywhere t)
(ido-vertical-mode t)

(flx-ido-mode t)

(set-face-foreground 'ido-first-match (face-foreground 'font-lock-variable-name-face))

(setq flx-ido-use-faces nil)
(setq ido-auto-merge-work-directories-length nil)
(setq ido-enable-flex-matching t)
(setq ido-use-faces t)
(setq ido-vertical-define-keys 'C-n-C-p-up-and-down)

;;
;; File -> Major mode association
;;

(add-to-list 'auto-mode-alist '("COMMIT_EDITMSG" . git-commit-mode))
(add-to-list 'auto-mode-alist '("Vagrantfile" . ruby-mode))
(add-to-list 'auto-mode-alist '("\\.bat\\'" . batch-mode))
(add-to-list 'auto-mode-alist '("\\.markdown\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.md\\'" . gfm-mode))
(add-to-list 'auto-mode-alist '("\\.ps1\\'" . powershell-mode))
(add-to-list 'auto-mode-alist '("\\.webapp\\'" . json-mode))
(add-to-list 'auto-mode-alist '("\\.sip\\'" . c++-mode))

;;
;; Hooks
;;

(add-hook 'after-save-hook 'executable-make-buffer-file-executable-if-script-p)
(add-hook 'after-save-hook 'sublimacs-recompile-current-el)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'time-stamp)

;;
;; Scheduled Tasks
;;

(run-with-timer 0 (* 60 60) 'clean-buffer-list)

;;
;; Keymap
;;

(define-minor-mode sublimacs-mode
    "Sublime Text-like keymap."
    :global t
    :init-value t
    :lighter ""
    :keymap `(
              ;; General
              (,(kbd "C-<next>") . next-buffer)
              (,(kbd "C-<prior>") . previous-buffer)
              (,(kbd "C-S-p") . smex)
              (,(kbd "C-f") . isearch-forward)
              (,(kbd "C-o") . ido-find-file)
              (,(kbd "C-q") . save-buffers-kill-terminal)
              (,(kbd "C-s") . save-buffer)
              (,(kbd "C-w") . sublimacs-kill-current-buffer)
              (,(kbd "C-x C-r") . sublimacs-open-recent-file)

              ;; Window movement
              (,(kbd "M-<down>") . windmove-down)
              (,(kbd "M-<left>") . windmove-left)
              (,(kbd "M-<right>") . windmove-right)
              (,(kbd "M-<up>") . windmove-up)

              ;; Editing
              (,(kbd "<backspace>") . delete-backward-char)
              (,(kbd "<end>") . end-of-line)
              (,(kbd "<home>") . beginning-of-line)
              (,(kbd "<kp-delete>") . delete-forward-char)
              (,(kbd "C-/") . sublimacs-comment-or-uncomment-line-or-region)
              (,(kbd "C-<backspace>") . backward-kill-word)
              (,(kbd "C-<down-mouse-1>") . mc/add-cursor-on-click)
              (,(kbd "C-<kp-delete>") . kill-word)
              (,(kbd "C-<left>") . backward-word)
              (,(kbd "C-<right>") . forward-word)
              (,(kbd "C-S-d") . duplicate-thing)
              (,(kbd "C-S-g") . goto-line)
              (,(kbd "C-S-k") . kill-whole-line)
              (,(kbd "C-S-l") . mc/edit-ends-of-lines)
              (,(kbd "C-a") . mark-whole-buffer)
              (,(kbd "C-d") . mc/mark-next-like-this)
              (,(kbd "C-l") . sublimacs-select-line)
              (,(kbd "RET") . sublimacs-enter)

              ;; Project
              (,(kbd "<f7>") . projectile-compile-project)
              (,(kbd "C-S-f") . projectile-ag)
              (,(kbd "C-p") . projectile-find-file)

              ;; Bookmarks
              (,(kbd "<f2>") . bookmark-jump)
              (,(kbd "C-<f2>") . bookmark-set)
              (,(kbd "S-<f2>") . bookmark-bmenu-list)

              ;; Custom Functions
              (,(kbd "<escape>") . sublimacs-escape-quit)
              (,(kbd "<f11>") . whitespace-mode)
              (,(kbd "<f12>") . sublimacs-indent-buffer)
              (,(kbd "<f8>") . ff-find-other-file)

              ;; Misc
              (,(kbd "C-+") . text-scale-increase)
              (,(kbd "C--") . text-scale-decrease)
              (,(kbd "M-RET") . toggle-frame-fullscreen)
              ))

;; See: http://stackoverflow.com/a/5340797
(defadvice load (after enforce-sublimacs-mode-keymap)
    "Try to ensure that sublimacs-mode keybindings always have priority."
    (if (not (eq (car (car minor-mode-map-alist)) 'sublimacs-mode))
            (let ((sublimacs-mode-keys (assq 'sublimacs-mode minor-mode-map-alist)))
                (assq-delete-all 'sublimacs-mode minor-mode-map-alist)
                (add-to-list 'minor-mode-map-alist sublimacs-mode-keys))))

(ad-activate 'load)

;;
;; Utility functions
;;

(defun sublimacs-enter ()
    (interactive)
    (if (minibufferp)
            (exit-minibuffer)
        (newline-and-indent)))

(defun sublimacs-comment-or-uncomment-line-or-region ()
    "Comment or uncomment the current line or region."
    (interactive)
    (if (region-active-p)
            (comment-or-uncomment-region (region-beginning) (region-end))
        (progn
            (comment-or-uncomment-region (line-beginning-position) (line-end-position))
            (forward-line))))

(defun sublimacs-escape-quit ()
    "Forcefully close the minibuffer window."
    (interactive)
    (when (active-minibuffer-window)
        (select-window (active-minibuffer-window))
        (keyboard-escape-quit)))

(defun sublimacs-indent-buffer ()
    "Re-indent the current buffer."
    (interactive)
    (save-excursion
        (indent-region (point-min) (point-max) nil)))

(defun sublimacs-kill-current-buffer ()
    "Kill the current buffer."
    (interactive)
    (kill-buffer (current-buffer)))

(defun sublimacs-select-line()
    "Select the current line on first invocation or extend the region by one line after each invocation."
    (interactive)
    (beginning-of-line)
    (when (not (region-active-p))
        (set-mark (line-beginning-position)))
    (forward-line))

(defun sublimacs-open-recent-file ()
    "Integrate `ido-completing-read' with function `recentf-mode'."
    (interactive)
    (find-file (ido-completing-read "Find recent file: " recentf-list)))

(defun sublimacs-recompile-current-el ()
    "Recompile the current Elisp buffer."
    (if (eq major-mode 'emacs-lisp-mode)
            (save-excursion (byte-compile-file buffer-file-name))))

;;
;; Misc
;;

(setq yaml-indent-offset 4)
(setq ruby-indent-level 4)
(setq web-mode-indent-style 4)
(setq-default web-mode-indent-style 4)

(provide 'sublimacs)
;;; sublimacs.el ends here.
