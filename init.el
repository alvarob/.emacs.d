;;; Initialize packages before:
(setq package-enable-at-startup nil)
(package-initialize)

;; pt-Br dead keys to work
(require 'iso-transl)
;; Set encoding
(prefer-coding-system 'utf-8)
(setq coding-system-for-read 'utf-8)
(setq coding-system-for-write 'utf-8)

;; specific local settings
(when (file-exists-p "~/.emacs.d/local-settings.el")
  (load-file "~/.emacs.d/local-settings.el"))


;; Repos
(setq package-archives '(("melpa" . "http://melpa.milkbox.net/packages/")
			 ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
                         ))


;; Custom theme path
;; add-to-list 'custom-theme-load-path "~/.emacs.d/themes")

;; Activate cua mode
(cua-mode t)

;; Remove toolbar
(tool-bar-mode -1)
(menu-bar-mode -1)

;; No initial screen
(setq-default inhibit-startup-screen t)

;; Setup scratch buffer
(setq-default initial-scratch-message "# coding: utf-8\n")
(setq initial-major-mode 'python-mode)

;; yes or no becomes y or n
(defalias 'yes-or-no-p 'y-or-n-p)

;; Turn off word wrapping
;;(setq-default truncate-lines 1)

;; Auto linum-mode
(global-linum-mode 1)

;; Auto paren-mode
(show-paren-mode 1)

;; yasnippet
;; should be loaded before auto complete so that they can work together
(require 'yasnippet)
(setq yas-snippet-dirs (append yas-snippet-dirs
                               '("~/.emacs.d/custom-snippets")))
(yas-global-mode 1)

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
(setq org-agenda-files (list "~/.org/"))

;; flycheck
(add-hook 'after-init-hook #'global-flycheck-mode)

;; Web mode
(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.html?\\'" . web-mode))
(setq web-mode-enable-current-element-highlight t)
(defun my-web-mode-hook () 
  "Hooks for Web mode." 
  (setq web-mode-enable-auto-pairing t)) 
(add-hook 'web-mode-hook 'my-web-mode-hook)

(require 'zencoding-mode)
(add-hook 'sgml-mode-hook 'zencoding-mode)
(add-hook 'web-mode-hook 'zencoding-mode)

;; pretty lambdas
(require 'pretty-lambdada)
(pretty-lambda-for-modes)
(add-hook 'python-mode-hook 'turn-on-pretty-lambda-mode)

;; Language specific configuration
(load-file "~/.emacs.d/cpp.el")
(load-file "~/.emacs.d/haskell.el")
