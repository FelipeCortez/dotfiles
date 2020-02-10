;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

(setq user-full-name "Felipe Cortez"
      user-mail-address "me@felipecortez.net")

(setq doom-font (font-spec :family "Triplicate T4c" :size 14))

(setq doom-theme 'doom-solarized-light)

(setq org-directory "~/org/")

(setq display-line-numbers-type 'relative)

(setq evil-move-beyond-eol t)

(use-package! lispyville
  :hook ((common-lisp-mode . lispyville-mode)
         (emacs-lisp-mode . lispyville-mode)
         (scheme-mode . lispyville-mode)
         (racket-mode . lispyville-mode)
         (hy-mode . lispyville-mode)
         (lfe-mode . lispyville-mode)
         (clojure-mode . lispyville-mode))
  :config
  (lispyville-set-key-theme
   `(additional
     additional-insert
     (additional-movement normal visual motion)
     (additional-wrap normal insert)
     (atom-movement t)
     c-w
     c-u
     (commentary normal visual)
     (escape insert emacs)
     (operators normal)
     prettify
     text-objects
     slurp/barf-cp)))

(use-package! olivetti :hook (org-mode . olivetti-mode))

(defun orgify ()
  "Recursively index org files"
  (interactive)
  (setq-default
   org-directory "/home/felipecortez/org/"
   org-agenda-files (directory-files-recursively "/home/felipecortez/org/" "\\.org$")
   org-refile-targets '((nil :maxlevel . 9) (org-agenda-files :maxlevel . 9))
   org-refile-use-outline-path t))
