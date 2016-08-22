(global-hl-line-mode 0)

(prelude-require-packages
 '(
   yasnippet
   )
 )

(yas-global-mode +1)

(require 'flycheck-mypy)

(flycheck-add-next-checker 'python-flake8' (warning . python-mypy))
