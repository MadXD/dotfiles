;;; cua-modern-mode --- Summary
;;; Commentary:
;;; Code:

;;; Dependencies:
;;; - comment-dwim-2
;;; - projectile

;;;###autoload
(define-minor-mode cua-modern-mode
  "cua-modern-mode doc"
  :lighter " cua++"
  :global t
  :keymap `(("C-/" . comment-dwim-2)
            ("C-M-f" . projectile-ag)
            ("C-S-d" . duplicate-line-or-region)
            ("C-S-k" . kill-whole-line)
            ("C-S-p" . smex)
            ("C-S-w" . delete-frame)
            ("C-c o" . multi-occur)
            ("C-d" . mc/mark-next-like-this)
            ("C-f" . isearch-forward)
            ("C-o" . find-file)
            ("C-p" . projectile-find-file)
            ("C-s" . save-buffer)
            ("C-x C-r" . ido-recentf-open)))

(provide 'cua-modern-mode)
;;; cua-modern-mode.el ends here
