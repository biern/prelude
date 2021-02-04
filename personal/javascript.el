(prelude-require-packages
 '(
   tide
   typescript-mode
   web-mode
   prettier-js
   add-node-modules-path
   )
 )

;; To install eslint:
;; npm install -g eslint babel-eslint eslint-plugin-react
;; eslint -v # view version and confirm that its in your path

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))


(require 'prettier-js)

(eval-after-load 'typescript-mode
  '(progn
     (add-hook 'typescript-mode-hook #'add-node-modules-path)
     (add-hook 'typescript-mode-hook #'prettier-js-mode)))

(eval-after-load 'web-mode
  '(progn
     (add-hook 'web-mode-hook #'add-node-modules-path)
     (add-hook 'web-mode-hook #'prettier-js-mode)))

(eval-after-load 'js2-mode
  '(progn
     (add-hook 'js2-mode-hook #'add-node-modules-path)
     (add-hook 'js2-mode-hook #'prettier-js-mode)))

(add-hook 'js2-mode-hook (lambda () (setq js-indent-level 2)))
(add-hook 'typescript-mode-hook (lambda () (setq typescript-indent-level 2)))
