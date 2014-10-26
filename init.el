;;; Initialize packages before:
(setq package-enable-at-startup nil)
(package-initialize)

;; pt-Br dead keys to work
(require 'iso-transl)
;; Set encoding
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; Repos
(setq package-archives '(("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ("melpa" . "http://melpa.milkbox.net/packages/")))
;; Activate cua mode
(cua-mode t)

;; Remove toolbar
(tool-bar-mode -1)

;; No initial screen
(setq-default inhibit-startup-screen t)

;; Clear scratch buffer
(setq-default initial-scratch-message nil)

;; yes or no becomes y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Turn off word wrapping
(setq-default truncate-lines 1)

;; Auto linum-mode
(global-linum-mode 1)

;; Auto paren-mode
(show-paren-mode 1)

;; Theme
(load-theme 'zenburn t)

;; yasnippet
;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(yas-global-mode 1)

;; Fix yasnippet 0.8/ac bug
(defalias 'yas/get-snippet-tables 'yas--get-snippet-tables)
(defalias 'yas/table-hash 'yas--table-hash)

;; auto complete mode
;; should be loaded after yasnippet so that they can work together
(require 'auto-complete-config)
(add-to-list 'ac-dictionary-directories "~/.emacs.d/ac-dict")
(ac-config-default)
;; set the trigger key so that it can work together with yasnippet on tab key,
;; if the word exists in yasnippet, pressing tab will cause yasnippet to
;; activate, otherwise, auto-complete will
(ac-set-trigger-key "TAB")
(ac-set-trigger-key "<tab>")

;; 'PgDown/PgUp' bindings:
(require 'smartrep)
(smartrep-define-key
    global-map "C-c" '(("n" . (scroll-up-command))
                       ("p" . (scroll-down-command))
                      ))

;; org mode
;; http://orgmode.org/worg/org-tutorials/orgtutorial_dto.html for reference
(require 'org)
(define-key global-map "\C-cl" 'org-store-link)
(define-key global-map "\C-ca" 'org-agenda)
(setq org-log-done t)
(setq org-agenda-files (list "~/alvr-org/"))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

(load-file "~/.emacs.d/cpp.el")
(load-file "~/.emacs.d/py.el")

;; specific local settings
(when (file-exists-p "~/.emacs.d/local-settings.el")
  (load-file "~/.emacs.d/local-settings.el"))


