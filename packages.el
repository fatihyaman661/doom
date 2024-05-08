;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;; (package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/radian-software/straight.el#the-recipe-format
;; (package! another-package
;;   :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;; (package! this-package
;;   :recipe (:host github :repo "username/repo"
;;            :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;; (package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;; (package! builtin-package :recipe (:nonrecursive t))
;; (package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see radian-software/straight.el#279)
;; (package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;; (package! builtin-package :pin "1a2b3c4d5e")

;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;; (unpin! pinned-package)
;; ...or multiple packages
;; (unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;; (unpin! t)

(package! ivy)
(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))
(package! ivy-rich)
(use-package ivy-rich
  :config
  (ivy-rich-mode 1))
(package! all-the-icons)
(use-package all-the-icons
  :if (display-graphic-p))
(package! all-the-icons-ivy-rich)
(use-package all-the-icons-ivy-rich
  :config
  (all-the-icons-ivy-rich-mode 1))
(package! anzu)
(use-package anzu
  :config
  (global-anzu-mode +1)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))
(package! company)
(use-package company)
(package! company-statistics)
(use-package company-statistics
  :config
  (company-statistics-mode 1))
(package! counsel)
(use-package counsel)
(package! crux)
(use-package crux)
(package! drag-stuff)
(use-package drag-stuff
  :config
  (drag-stuff-global-mode t)
  (drag-stuff-define-keys))
(package! eglot)
(use-package eglot)
(package! emojify)
(use-package emojify)
(package! emojify-logos)
(use-package emojify-logos)
(package! flycheck)
(use-package flycheck)
(package! flycheck-eglot)
(use-package flycheck-eglot
  :config
  (global-flycheck-eglot-mode 1))
(package! goto-line-preview)
(use-package goto-line-preview
  :init
  (global-set-key [remap goto-line] 'goto-line-preview))
(package! helm)
(use-package helm)
(package! highlight-indentation)
(use-package highlight-indentation
  :config
  (highlight-indentation-mode +1))
(package! hydra)
(use-package hydra)
(package! magit-delta)
(use-package magit-delta)
(package! magit-section)
(use-package magit-section)
(package! major-mode-hydra)
(use-package major-mode-hydra)
(package! mode-icons)
(use-package mode-icons
  :config
  (mode-icons-mode 1))
(package! popup)
(use-package popup)
(package! pretty-hydra)
(use-package pretty-hydra)
(package! rainbow-mode)
(use-package rainbow-mode
  :config
  (rainbow-mode +1))
(package! swiper)
(use-package swiper)
(package! transient)
(use-package transient)
(package! undo-fu)
(use-package undo-fu
  :config
  (undo-fu-session-global-mode t))
(package! smartparens)
(use-package smartparens
  :config
  (smartparens-mode +1))
(package! undo-fu-session)
(use-package undo-fu-session)
(package! vundo)
(use-package vundo)
(package! gdscript-mode)
(use-package gdscript-mode
  :hook (gdscript-mode . eglot-ensure)
  :hook (gdscript-mode . company-mode))
(package! pdf-tools)
(use-package pdf-tools)
(package! xenops)
(use-package xenops)
