;;; unifmt --- Summary
;;; Commentary:
;;; Code:

(defgroup unifmt '() "Universal formatter.")

(defcustom unifmt-major-modes
  '(c-mode c++-mode css-mode go-mode js-mode json-mode python-mode sass-mode scss-mode xml-mode nxml-mode)
  "The list of major modes where unifmt is able to operate.
Note that not all languages are supported by unifmt, thus
enabling it for an unsupported language will do nothing."
  :group 'unifmt
  :require 'unifmt
  :type '(repeat symbol))

;;;###autoload
(defun unifmt-after-save ()
  "TODO."
  (interactive)
  (when (memq major-mode unifmt-major-modes)
    (message "Formatting buffer...")
    (call-process "~/Development/Go/bin/unifmt" nil nil nil (buffer-file-name))
    (revert-buffer t t t)
    (message nil)))

(provide 'unifmt)
;;; unifmt.el ends here
