(defun date ()
    "Insert current date yyyy-mm-dd."
    (interactive)
    (when (use-region-p)
        (delete-region (region-beginning) (region-end)))
    (insert (format-time-string "%Y-%m-%d")))

(add-hook 'before-save-hook 'gofmt-before-save)

(setq handlebars-basic-offset 4)
(setq ruby-indent-level 4)
(setq sgml-basic-offset 4)
(setq sws-tab-width 4)
(setq web-mode-code-indent-offset 4)
(setq web-mode-css-indent-offset 4)
(setq web-mode-markup-indent-offset 4)
(setq coffee-tab-width 4)
(setq yaml-indent-offset 4)


(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.[gj]sp\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.as[cp]x\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.djhtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.erb\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.hbs\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.xhtml?\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.mustache\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.phtml\\'" . web-mode))
(add-to-list 'auto-mode-alist '("\\.tpl\\.php\\'" . web-mode))


(setq projectile-file-exists-remote-cache-expire (* 4 60 60))
(setq projectile-file-exists-local-cache-expire (* 4 60 60))
(setq projectile-indexing-method 'alien)

(require 'smart-mode-line)
(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'respectful)

(rich-minority-mode t)
(setq rm-whitelist '(""))

(define-globalized-minor-mode real-global-auto-complete-mode
    auto-complete-mode (lambda ()
                           (if (not (minibufferp (current-buffer)))
                                   (auto-complete-mode 1))))
(global-auto-complete-mode -1)
(real-global-auto-complete-mode t)

;; install pos-tip and fuzzy

(setq ac-auto-show-menu 0.8)
(setq ac-auto-start nil)
(setq ac-ignore-case t)
(setq ac-menu-height 5)
(setq ac-use-quick-help nil)
(setq ac-sources '(ac-source-filename
                   ac-source-words-in-all-buffer
                   ac-source-symbols
                   ac-source-dictionary))


(set-default 'truncate-lines t)
(setq-default truncate-lines t)
(add-hook 'markdown-mode-hook (lambda () (setq truncate-lines t)))


(add-to-list 'default-frame-alist '(height . 50))
(add-to-list 'default-frame-alist '(width . 160))
