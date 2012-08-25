;; todo: install script with
;; 
;; git submodule init
;; git submodule update
;; on windows setup current user as the owner of the .emacs.d/server folder (created after the first run)


;accenti con -nw
(set-keyboard-coding-system 'iso-latin-1)

(set-language-environment 'Latin-1)
;; (default-enable-multibyte-characters t)

(add-to-list 'load-path "~/.emacs.d/")
(load "ggb_emacs_cfg") 
