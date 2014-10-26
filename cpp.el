(require 'cc-mode)
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 0))
(add-hook 'c++-mode-hook 'my-c++-mode-hook)

;; auto-complete-clang
(require 'auto-complete-clang)
(define-key c-mode-base-map [(control tab)] 'ac-complete-clang)

;; Custom quick c++ compile
(defun cpp-compile-and-run ()
  "Quick compile & run command for single cpp files"
  (interactive)
  
  (let ((f (file-name-base
	    (buffer-file-name
	     (window-buffer (minibuffer-selected-window))
	     ))))
    
    (compile (format "g++ -o %s -Wall %s.cpp && ./%s < %s.in" f f f f)))
)
(define-key c-mode-base-map [f9] 'cpp-compile-and-run)
