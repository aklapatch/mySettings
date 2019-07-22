
; nixos commended settings ================================================
(require 'package)

;(setq package-enable-at-startup nil)


; NO TABS + tab settings ====================================================
(setq-default indent-tabs-mode nil)
(setq standard-indent 2) ; standard indent
(setq tab-width 2) ; or any other preferred value
(setq c-basic-offset tab-width) ; c mode indent
(setq cperl-indent-level tab-width) ; perl mode indent

(add-hook 'text-mode-hook ; text mode indentation
          '(lambda ()
             (setq indent-tabs-mode nil)
             (setq tab-width 2)))

;======================Installing missing packages================================

; list the packages you want
(setq package-list '(rainbow-delimiters
		     rainbow-identifiers
		     auto-complete
		     async
		     real-auto-save
                     highlight-indent-guides))

; list the repositories containing them
(setq package-archives '(("elpa" . "http://tromey.com/elpa/")
                         ("gnu" . "http://elpa.gnu.org/packages/")
                         ("marmalade" . "http://marmalade-repo.org/packages/")
			 ("melpa" . "https://melpa.org/packages/")
			 ))

; activate all the packages (in particular autoloads)
(package-initialize)

; fetch the list of packages available 
(unless package-archive-contents
  (package-refresh-contents))

; install the missing packages
(dolist (package package-list)
  (unless (package-installed-p package)
    (package-install package)))
   
(package-initialize)

;=================garbage collector tuning=====================================

(defun my-minibuffer-setup-hook ()
  (setq gc-cons-threshold most-positive-fixnum))

(defun my-minibuffer-exit-hook ()
  (setq gc-cons-threshold 800000))

(add-hook 'minibuffer-setup-hook #'my-minibuffer-setup-hook)
(add-hook 'minibuffer-exit-hook #'my-minibuffer-exit-hook)

; highlight-indent-guides-settings =============================================
(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)
(setq highlight-indent-guides-method 'column)
(setq highlight-indent-guides-auto-odd-face-perc 10)
(setq highlight-indent-guides-auto-even-face-perc 20)
(setq highlight-indent-guides-auto-character-face-perc 20)

; ================= real auto save settings =================
(require 'real-auto-save)
(add-hook 'prog-mode-hook 'real-auto-save-mode)
(add-hook 'text-mode-hook 'real-auto-save-mode)
(setq real-auto-save-interval 3) ; seconds

;keep the startup screen from coming up ========================
(setq inhibit-startup-screen t)

; turn on column #'s ======================================
(setq column-number-mode t)

; file reloading mode =======================================
;should reload the file when it change
(auto-revert-mode 1)

 ; set copy/paste/cut buttons to C-c/C-v/etc ==========================
(cua-mode t)

; turn on rainbow identifiers ===========================
(add-hook 'prog-mode-hook 'rainbow-identifiers-mode)
(add-hook 'text-mode-hook 'rainbow-identifiers-mode)


; turn on rainbow delimiters =========================================
(add-hook 'prog-mode-hook 'rainbow-delimiters-mode)
(add-hook 'text-mode-hook 'rainbow-delimiters-mode)


; This has to be after package-initialize autocomplete settings ================
(ac-config-default) ; 
(global-auto-complete-mode t)
(setq ac-auto-show-menu    0.0)
(setq ac-delay             0.0)
(setq ac-menu-height       5)
(setq ac-show-menu-immediately-on-auto-complete t)
(defun auto-complete-mode-maybe ()
  "No maybe for you. Only AC!"
  (unless (minibufferp (current-buffer))
    (auto-complete-mode 1)))

; custom set variables ===============================================================

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(column-number-mode t)
 '(cua-mode t nil (cua-base))
 '(custom-enabled-themes (quote (wheatgrass)))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (real-auto-save rainbow-delimiters rainbow-identifiers auto-complete)))
 '(show-paren-mode t))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:family "Courier New" :foundry "outline" :slant normal :weight bold :height 98 :width normal)))))
