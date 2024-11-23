;; init.el --- Emacs configuration

;; INSTALL PACKAGES
;; --------------------------------------

(when (>= emacs-major-version 24)

  (require 'package)
  (setq package-archives '())
  (add-to-list 'package-archives '("gnu" . "http://elpa.gnu.org/packages/"))
  (add-to-list 'package-archives '("marmalade" . "http://marmalade-repo.org/packages/"))
  (add-to-list 'package-archives '("melpa" . "http://stable.melpa.org/packages/"))
  (package-initialize))

  (defvar package-list
    '(ein
      elpy
      flycheck
      magit
      py-autopep8))

  ; fetch the list of packages available
  (or (file-exists-p package-user-dir)
      (package-refresh-contents))

  ; install the missing packages
  (dolist (package package-list)
    (unless (package-installed-p package)
      (package-install package)))

;; BACKUPS
;; --------------------------------------

;; version control
(setq vc-make-backup-files t)
(setq version-control t ;; Use version numbers for backups.
  kept-new-versions 10 ;; Number of newest versions to keep.
  kept-old-versions 0 ;; Number of oldest versions to keep.
  delete-old-versions t ;; Don't ask to delete excess backup versions.
  backup-by-copying t) ;; Copy all files, don't rename them.

;; Default and per-save backups go here:
(setq backup-directory-alist '(("" . "~/.emacs.d/backup/per-save")))

;; BASIC CUSTOMIZATION
;; --------------------------------------
(setq inhibit-splash-screen t) ; Splash screen? Meh.
(setq inhibit-startup-message t) ; No startup message
(tool-bar-mode 0) ; No ugly toolbar
(show-paren-mode 1)
(setq frame-title-format (list "%b - " invocation-name))

(setq-default indent-tabs-mode nil)
(setq-default tab-width 4)
(setq-default column-number-mode 1)

;; ido
(when (require 'ido nil t)
  (setq ido-everywhere t)
  (ido-mode 1))

;; git-gutter
(when (require 'git-gutter nil t)
  (global-git-gutter-mode t) 
  (custom-set-variables
   '(git-gutter:update-interval 2))
  (custom-set-variables
   '(git-gutter:modified-sign "  ")
   '(git-gutter:added-sign "++")
   '(git-gutter:deleted-sign "--"))

  (set-face-background 'git-gutter:modified "purple")
  (set-face-foreground 'git-gutter:added "green")
  (set-face-foreground 'git-gutter:deleted "red"))

;; PYTHON CONFIGURATION
;; --------------------------------------
;; elpy
(when (require 'elpy nil t)
 (elpy-enable))

;; use flycheck not flymake with elpy
(when (require 'flycheck nil t)
 (setq elpy-modules (delq 'elpy-module-flymake elpy-modules))
 (add-hook 'elpy-mode-hook 'flycheck-mode))

;; enable autopep8 formatting on save
(when (require 'py-autopep8 nil t)
 (add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save))

;; init.el ends here

