;; Works with system rebinding of:
;; caps-lock -> cmd
;; cmd -> option
;; option -> cmd

(setq mac-command-modifier 'control)
(setq mac-control-modifier 'command)
(setq mac-option-modifier 'none)
(setq mac-right-option-modifier 'meta) ;; somehow this rebinds the left option modifier
