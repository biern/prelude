;; if in venv:
;; python -m venv .venv-emacs
;; source .venv-emacs/bin/activate
;; pip install --user python-language-server[all].

(prelude-require-packages
 '(
   lsp-mode
   )
 )

(use-package lsp-mode
  :hook
  ((python-mode . lsp)))

(use-package lsp-mode
  :config
  (lsp-register-custom-settings
   '(("pyls.plugins.pyls_mypy.enabled" t t)
     ("pyls.plugins.pyls_mypy.live_mode" nil t)
     ("pyls.plugins.pyls_black.enabled" t t)
     ("pyls.plugins.pyls_isort.enabled" t t)))
  :hook
  ((python-mode . lsp)))

(setq exec-path (append exec-path '("~/Library/Python/3.9/bin")))
