(global-set-key (kbd "C-ò") '(lambda () ;; comment or uncomment current line/region
  (interactive)
  (let (beg end)
	(if (region-active-p)
	    (setq beg (region-beginning) end (region-end))
	    (setq beg (line-beginning-position) end (line-end-position)))
  (comment-or-uncomment-region beg end))
  (if (region-active-p)
      (setq deactivate-mark nil))
))

(global-set-key (kbd "C-S-u") '(lambda () ; comment/uncomment region
    (interactive)
    (comment-or-uncomment-region  (region-beginning) (region-end))
    (setq deactivate-mark nil))
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
