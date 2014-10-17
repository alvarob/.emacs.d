;; Initialize packages before:
(setq package-enable-at-startup nil)
(package-initialize)

;; For pt-Br dead keys to work
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

;; Auto linum-mode
(global-linum-mode 1)

;; Theme
(load-theme 'zenburn t)

;; PgDown/PgUp bindings:
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
