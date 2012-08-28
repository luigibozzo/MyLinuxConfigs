(setq-default inhibit-startup-screen t)

;; hightlight symbol: http://nschum.de/src/emacs/highlight-symbol
(require 'highlight-symbol)
(global-set-key [(control f3)] 'highlight-symbol-at-point)
(global-set-key [f3] 'highlight-symbol-next)
(global-set-key [(shift f3)] 'highlight-symbol-prev)
(global-set-key [(meta f3)] 'highlight-symbol-prev)


;; line numbers
(global-linum-mode t)

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t))
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(default ((t (:inherit nil :stipple nil :background "white" :foreground "black" :inverse-video nil :box nil :strike-through nil :overline nil :underline nil :slant normal :weight normal :height 120 :width normal :foundry "unknown" :family "DejaVu Sans Mono")))))

; color-theme
; in order to use it you have to install the emacs-goodies-el package:
;    sudo apt-get install emacs-goodies-el
; (add-to-list 'load-path "/usr/share/emacs/site-lisp/emacs-goodies-el/color-theme")
(require 'color-theme)

;; (defun color-theme-undo ()
;;   (interactive)
;;   (color-theme-reset-faces)
;;   (color-theme-snapshot))

;; ;; backup current color theme
;; (fset 'color-theme-snapshot (color-theme-make-snapshot))

(eval-after-load "color-theme"
   '(progn
      (color-theme-initialize)
      (color-theme-ld-dark)))
