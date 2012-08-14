(server-start)

(setq c-basic-offset 4) ;; tab is multiple of 4



;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference
;;; packages in your .emacs.
(when
(load
(expand-file-name "~/.emacs.d/elpa/package.el"))
(package-initialize))

(require 'package)
(setq package-archives '(("ELPA" . "http://tromey.com/elpa/")
("gnu" . "http://elpa.gnu.org/packages/")
("marmalade" . "http://marmalade-repo.org/packages/")))
(package-initialize)

    ;; haskell
(load "haskell-mode/haskell-site-file")

(remove-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (remove-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
;; (defun my-haskell-mode-hook ()
;;    (haskell-indentation-mode -1) ;; turn off, just to be sure
;;    (haskell-indent-mode 1)       ;; turn on indent-mode
;;    )             


(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)
(global-set-key [(meta f12)] 'recentf-open-files)

(setq column-number-mode t)
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

(defun color-theme-undo ()
  (interactive)
  (color-theme-reset-faces)
  (color-theme-snapshot))

;; backup current color theme
(fset 'color-theme-snapshot (color-theme-make-snapshot))

(eval-after-load "color-theme"
   '(progn
      (color-theme-initialize)
      (color-theme-ld-dark)))


;; recentf stuff
(require 'recentf)
(setq recentf-auto-cleanup 'never) ;; disable before we start recentf!
(recentf-mode 1)
(setq recentf-max-menu-items 25)
(global-set-key "\C-x\ \C-r" 'recentf-open-files)

; ido mode
(setq ido-enable-flex-matching t)
(setq ido-everywhere t)
(ido-mode 1)
(setq ido-file-extensions-order '(".hs" ".clj" ".txt" ".py" ".emacs" ".xml" ".el" ".ini" ".cfg" ".cnf"))

;; clipboard integration with X
(setq x-select-enable-clipboard t)

;; line numbers
(global-linum-mode t)

;; cycle through buffers with Ctrl-Tab / Ctrl-Shift-Tab
(global-set-key (kbd "<C-tab>") 'bury-buffer)
(global-set-key (kbd "<C-S-iso-lefttab>") 'unbury-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key [(shift f1)] 'call-last-kbd-macro)
(define-key global-map "\C-h" 'backward-delete-char) 


(defun duplicate-line()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
  (yank)
  (open-line 1)
  (next-line 1)
  (yank)
)
(global-set-key (kbd "C-c d") 'duplicate-line)

(defun kill-whole-line-wherever-you-are()
  (interactive)
  (move-beginning-of-line 1)
  (kill-line)
)
(global-set-key (kbd "C-k") 'kill-whole-line-wherever-you-are)
(global-set-key (kbd "C-S-k") 'kill-line)


(global-set-key "\C-cy" '(lambda ()
    (interactive) 
    (popup-menu 'yank-menu))
)

(defun unindent-region ()
    (interactive)
    (indent-region (region-beginning) (region-end) -1)
    (setq deactivate-mark nil)
)
(defun tab-indent-region ()
    (interactive)
    (setq fill-prefix "\t")
    (indent-region (region-beginning) (region-end) 4)
    (setq deactivate-mark nil)
)

(global-set-key (kbd "TAB") 'tab-indent-region)
(global-set-key (kbd "<backtab>") 'unindent-region)

(global-set-key (kbd "C-S-u") '(lambda () ; comment region
    (interactive)
    (comment-region  (region-beginning) (region-end)) 
    (setq deactivate-mark nil))
)
(global-set-key (kbd "C-S-i") '(lambda () ; uncomment region
    (interactive)
    (uncomment-region  (region-beginning) (region-end)) 
    (setq deactivate-mark nil))
)



