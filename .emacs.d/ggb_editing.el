(global-set-key (kbd "C-,") '(lambda () ;;   "comment or uncomment current line"
  (interactive)
  (comment-or-uncomment-region (line-beginning-position) (line-end-position))
  )
)

;; clipboard integration with X
(setq x-select-enable-clipboard t)

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
