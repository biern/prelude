(global-hl-line-mode 0)

(prelude-require-packages
 '(
   yasnippet
   )
 )

(yas-global-mode +1)

(require 'flycheck-mypy)

(flycheck-add-next-checker 'python-flake8' (warning . python-mypy))

(with-eval-after-load 'org
  (setq org-startup-indented t) ; Enable `org-indent-mode' by default
  (add-hook 'org-mode-hook #'visual-line-mode)
  )
(setq whitespace-global-modes '(not org-mode))
(setq whitespace-line-column 118)

(setq helm-mode-fuzzy-match t)
