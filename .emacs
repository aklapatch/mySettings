(setq gc-cons-threshold 20000000) ; set garbage collection

; load emacs MELPA
;; load emacs 24's package system. Add MELPA repository.
(when (>= emacs-major-version 24)
  (require 'package)
  (add-to-list
   'package-archives
 '("melpa" . "http://stable.melpa.org/packages/") ; many packages won't show if using stable
   t))
(package-initialize)

; This has to be after package-initialize
(ac-config-default) ; autocomplete settings
(global-auto-complete-mode t)
(setq ac-auto-show-menu    0.2)
(setq ac-delay             0.2)
(setq ac-menu-height       10)

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wheatgrass)))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages (quote (auto-complete)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
