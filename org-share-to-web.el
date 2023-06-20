;;; org-share-to-web.el --- Share org to website. -*- lexical-binding: t;
;;
;; Copyright © 2023 Andros Fenollosa
;; Authors: Andros Fenollosa <andros@fenollosa.email>
;; URL: https://github.com/tanrax/org-share-to-web.el
;; Version: 1.0.0
;; SPDX-License-Identifier: GPL-3.0-or-later

;;; Commentary:
;; Share a Org document in an HTML document accessible online.

;;; Code:

(defvar org-share-to-web-domain "")
(defvar org-share-to-web-directory "")

(defun org-share-to-web-buffer ()
  "Share the current org file to the server, export to html and copy URL to clipboard."
  (interactive)
  (let* ((filename-current-buffer (buffer-name))
	 (filename-sans-extension (file-name-sans-extension filename-current-buffer))
	 (filename-html (concat filename-sans-extension ".html"))
	 (export-html (org-export-string-as (buffer-string) 'html)))
    (write-region export-html nil (concat org-share-to-web-directory filename-html))
    (tramp-cleanup-all-connections)
    (kill-new (concat org-share-to-web-domain filename-html)))
  (message "Org shared online. URL copied to clipboard!"))

(defun org-share-to-web-dired ()
  "Open directory where org files are shared."
  (interactive)
  (dired org-share-to-web-directory))

(provide 'org-share-to-web)

;;; org-share-to-web.el ends here
