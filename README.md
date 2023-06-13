## Install

Add in your `init.el`.

```elisp
(use-package org-share-to-web
  :straight (:host github :repo "tanrax/org-share-to-web.el" :files ("org-share-to-web.el"))
  :ensure t)
```

## Configure

Configure the domain to be used to access the file share and the directory where it will be hosted using Tramp.

```elisp
(setq org-share-to-web-domain "")
(setq org-share-to-web-directory "")
```

Example.

```elisp
(setq org-share-to-web-domain "https://mydomain.com/")
(setq org-share-to-web-directory "/ssh:debian@mydomain.com:~/www/")
```
