;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
;; (setq user-full-name "John Doe"
;;       user-mail-address "john@doe.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-symbol-font' -- for symbols
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-one)

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type t)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(setq org-directory "~/org/")

;;windmove moves
(when (fboundp 'windmove-default-keybindings)
  (windmove-default-keybindings))


;;Maximise window upon startup
(setq initial-frame-alist '((top . 1) (left . 1) (width . 114) (height . 32)))
(add-to-list 'initial-frame-alist '(maximized))



;;;;;;;Package activation;;;;;;;



(use-package ivy
  :config
  (ivy-mode 1)
  (setq ivy-use-virtual-buffers t)
  (setq ivy-count-format "(%d/%d) "))
(use-package ivy-rich
  :config
  (ivy-rich-mode 1))
(use-package all-the-icons
  :if (display-graphic-p))
(use-package all-the-icons-ivy-rich
  :config
  (all-the-icons-ivy-rich-mode 1))
(use-package anzu
  :config
  (global-anzu-mode +1)
  (global-set-key [remap query-replace] 'anzu-query-replace)
  (global-set-key [remap query-replace-regexp] 'anzu-query-replace-regexp))
(use-package company)
(use-package company-statistics
  :config
  (company-statistics-mode 1))
(use-package counsel)
(use-package crux)
(use-package drag-stuff
  :config
  (drag-stuff-global-mode t)
  (drag-stuff-define-keys))
(use-package eglot)
(use-package emojify)
(use-package emojify-logos)
(use-package flycheck)
(use-package flycheck-eglot
  :config
  (global-flycheck-eglot-mode 1))
(use-package goto-line-preview
  :init
  (global-set-key [remap goto-line] 'goto-line-preview))
(use-package helm)
(use-package highlight-indentation
  :config
  (highlight-indentation-mode +1))
(use-package hydra)
(use-package magit-delta)
(use-package magit-section)
(use-package major-mode-hydra)
(use-package mode-icons
  :config
  (mode-icons-mode 1))
(use-package popup)
(use-package pretty-hydra)
(use-package rainbow-mode
  :config
  (rainbow-mode +1))
(use-package swiper)
(use-package transient)
(use-package undo-fu
  :config
  (undo-fu-session-global-mode t))
(use-package smartparens
  :config
  (smartparens-mode +1))
(use-package undo-fu-session)
(use-package vundo)
(use-package gdscript-mode
  :hook (gdscript-mode . eglot-ensure)
  :hook (gdscript-mode . company-mode))
(use-package pdf-tools)
(use-package xenops)
(use-package! iedit
  :defer
  :config
  (set-face-background 'iedit-occurrence "Magenta")
  :bind
  ("C-;" . iedit-mode))
(use-package annotate)





;;;;;Key Bindings;;;;


(global-set-key (kbd "C-s") 'swiper-isearch)
(global-set-key (kbd "M-x") 'counsel-M-x)
(global-set-key (kbd "C-x C-f") 'counsel-find-file)
(global-set-key (kbd "M-y") 'counsel-yank-pop)
(global-set-key (kbd "<f1> f") 'counsel-describe-function)
(global-set-key (kbd "<f1> v") 'counsel-describe-variable)
(global-set-key (kbd "<f1> l") 'counsel-find-library)
(global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
(global-set-key (kbd "<f2> u") 'counsel-unicode-char)
(global-set-key (kbd "<f2> j") 'counsel-set-variable)
(global-set-key (kbd "C-x b") 'ivy-switch-buffer)
(global-set-key (kbd "C-c v") 'ivy-push-view)
(global-set-key (kbd "C-c V") 'ivy-pop-view)
(global-set-key (kbd "M-_") 'undo-fu-only-redo)
(map! "M-g g" #'avy-goto-line)
(map! "M-g M-g" #'avy-goto-line)

(setq lsp-dart-sdk-dir "/media/gamedisk/linux_programs/flutter/bin/cache/dart-sdk")
(setq lsp-dart-flutter-sdk "/media/gamedisk/linux_programs/flutter")
(setq flutter-sdk-path "/media/gamedisk/linux_programs/flutter")

;;Latex related
(setq +latex-viewers '(pdf-tools))
(setq lsp-tex-server 'texlab)
(add-hook 'LaTeX-mode-hook #'xenops-mode)
(map! :map cdlatex-mode-map
      :i "TAB" #'cdlatex-tab)


(add-hook 'prog-mode-hook #'company-mode)

(setq auto-save-default t
      make-backup-files t)


;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.

