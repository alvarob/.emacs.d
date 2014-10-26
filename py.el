;; flycheck-pyflakes
(require 'flycheck-pyflakes)
(add-hook 'python-mode-hook 'flycheck-mode)
(add-to-list 'flycheck-disabled-checkers 'python-flake8)
(add-to-list 'flycheck-disabled-checkers 'python-pylint)

;; pretty lambdas
(require 'pretty-lambdada)
(pretty-lambda-for-modes)
(add-hook 'python-mode-hook 'turn-on-pretty-lambda-mode)
