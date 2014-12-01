;; flycheck-pyflakes
(require 'flycheck)
(add-hook 'python-mode-hook 'flycheck-mode)

;; pretty lambdas
(require 'pretty-lambdada)
(pretty-lambda-for-modes)
(add-hook 'python-mode-hook 'turn-on-pretty-lambda-mode)
