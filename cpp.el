(require 'cc-mode)
(defun my-c++-mode-hook ()
  (setq c-basic-offset 4)
  (c-set-offset 'substatement-open 4))
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
    
    (compile (format "g++ -o %s -Wall -Wextra -pedantic -std=c++11 -O2 -Wshadow -Wformat=2 -Wfloat-equal -Wconversion -Wlogical-op -Wcast-qual -Wcast-align -fwhole-program -D_GLIBCXX_DEBUG -D_GLIBCXX_DEBUG_PEDANTIC -lmcheck -D_FORTIFY_SOURCE=2 -fsanitize=address -fsanitize=undefined -fstack-protector %s.cpp && ./%s < %s.in" f f f f)))
)
(define-key c-mode-base-map [f9] 'cpp-compile-and-run)
