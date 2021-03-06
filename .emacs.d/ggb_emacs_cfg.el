(load "global")
(load "ggb_editing")
(load "ggb_display_opts") 
(load "ggb_navigation")

(setq c-basic-offset 4) ;; tab is multiple of 4



;;; This provides support for the package system and
;;; interfacing with ELPA, the package archive.
;;; Move this code earlier if you want to reference packages in your .emacs.
;; (when (load (expand-file-name "~/.emacs.d/elpa/package.el"))
;;   (package-initialize))

;; (require 'package)
;;  (setq package-archives '(
;;    ("ELPA" . "http://tromey.com/elpa/")
;;    ("gnu" . "http://elpa.gnu.org/packages/")
;;    ("marmalade" . "http://marmalade-repo.org/packages/")))
;; (package-initialize)

;; haskell
;; (add-to-list 'load-path ".emacs.d/haskell-mode")
;; (load "haskell-mode/haskell-site-file")
;; (add-hook 'haskell-mode-hook 'turn-on-font-lock)       
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-indent)  
;; (add-hook 'haskell-mode-hook 'turn-on-haskell-ghci)    
;; ;; (add-hook 'haskell-mode-hook 'turn-on-haskell-doc-mode)
;; (add-hook 'haskell-mode-hook 'haskell-refac-mode)      
;; (add-hook 'haskell-mode-hook 'hs-lint-mode-hook)       

;; (remove-hook 'haskell-mode-hook 'turn-on-haskell-indent)
;; (remove-hook 'haskell-mode-hook 'turn-on-haskell-indentation)
;; (add-hook 'haskell-mode-hook 'my-haskell-mode-hook)
;; (defun my-haskell-mode-hook ()
;;    (haskell-indentation-mode -1) ;; turn off, just to be sure
;;    (haskell-indent-mode 1)       ;; turn on indent-mode
;;    )


(add-to-list 'load-path "~/.emacs.d/ghc-mod")
(autoload 'ghc-init "ghc" nil t)
(add-hook 'haskell-mode-hook (lambda () (ghc-init)))

(add-to-list 'load-path "~/.emacs.d/clojure-mode")
(load "clojure-mode")

(require 'recentf)
(recentf-mode 1)
(setq recentf-max-saved-items 500)
(setq recentf-max-menu-items 60)
(global-set-key [(meta f12)] 'recentf-open-files)


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


;; cycle through buffers with Ctrl-Tab / Ctrl-Shift-Tab
(global-set-key (kbd "<C-tab>") 'bury-buffer)
(global-set-key (kbd "<C-S-iso-lefttab>") 'unbury-buffer)
(global-set-key (kbd "<escape>") 'keyboard-escape-quit)
(global-set-key [(shift f1)] 'call-last-kbd-macro)


