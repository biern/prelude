(defun setup-tide-mode ()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  ;; (flycheck-add-next-checker 'typescript-tide '(t . typescript-tslint) 'append)
  (flycheck-add-next-checker 'typescript-tide '(t . javascript-eslint) 'append)
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  (personal-setup-tide-keys)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1))


(defun personal-setup-tide-keys ()
  (local-set-key (concat (kbd "C-c SPC") "s") 'tide-rename-symbol)
  (local-set-key (concat (kbd "C-c SPC") "f") 'tide-fix)
  (local-set-key (concat (kbd "C-c SPC") "u") 'tide-references)
  (local-set-key (concat (kbd "C-c SPC") "i") 'tide-format)
  (local-set-key (concat (kbd "C-c SPC") "m") 'tide-rename-file)
  (local-set-key (concat (kbd "C-c SPC") "r") 'tide-refactor)
  (local-set-key (concat (kbd "C-c SPC") "f") 'tide-fix)
  )


;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)

;; formats the buffer before saving
;; (add-hook 'before-save-hook 'tide-format-before-save)

(add-hook 'typescript-mode-hook #'setup-tide-mode)

;; TSX

(require 'web-mode)
(add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
(add-hook 'web-mode-hook
          (lambda ()
            (when (string-equal "tsx" (file-name-extension buffer-file-name))
              (setq web-mode-markup-indent-offset 2)
              (setup-tide-mode))))

;; ;; enable typescript-tslint checker
;; (flycheck-add-mode 'typescript-tslint 'web-mode)

(with-eval-after-load 'flycheck
  (flycheck-add-mode 'javascript-eslint 'typescript-mode))
