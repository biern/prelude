(require 'flycheck)

(flycheck-define-checker python-mypy
  "Mypy syntax checker. Requires mypy>=0.3.1.
Customize `flycheck-python-mypy-args` to enable mypy checker and specify path to check.
See URL `http://mypy-lang.org/'."

  :command ("mypy" (eval flycheck-python-mypy-args))
  :error-patterns
  ((error line-start (file-name) ":" line ": error:" (message) line-end))
  :modes python-mode
  :predicate (lambda () (bound-and-true-p flycheck-python-mypy-args))
  )

(add-to-list 'flycheck-checkers 'python-mypy t)

(provide 'flycheck-mypy)
