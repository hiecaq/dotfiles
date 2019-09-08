;; coding
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8-unix)
;; ui
(menu-bar-mode -1)

(cond ((eq system-type 'windows-nt)
       ;; windows specific
       )
      ((eq system-type 'gnu/linux)
       ;; linux specific
       ))
(cond ((display-graphic-p)
       ;; Graphical code goes here.
       (blink-cursor-mode -1)
       (scroll-bar-mode -1)
       (tool-bar-mode -1)
       )
      (t
       ;; Console-specific code
       ))
; (menu-bar-no-scroll-bar)
(setq-default indent-tabs-mode nil)

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(setq package-enable-at-startup nil)
(package-initialize) ;; You might already have this line

;; (setq use-package-always-demand t)
(eval-when-compile
  (require 'use-package))

(use-package general
  :ensure t
  :config
  (general-evil-setup))

(use-package gruvbox-theme
  :ensure t
  :config
  (load-theme 'gruvbox t))

(use-package paradox
  :ensure t
  :commands paradox-list-packages
  :custom
  (paradox-github-token t)
  (paradox-automatically-star nil)
  :config
  (paradox-enable))

(use-package org
  :general
  ("C-c l"  'org-store-link)
  ("C-c a"  'org-agenda)
  ("C-c c"  'org-capture))

(use-package ivy
  :ensure t
  :custom
  (ivy-use-virtual-buffers t "add recent files/bookmarks to ivy-switch-buffer")
  (ivy-count-format "(%d/%d) " "the style for displaying current candidate count")
  ;; (enable-recursive-minibuffers t "allow minibuffer cmd in minibuffer")
  )

(use-package swiper
  :ensure t
  :demand t
  :requires ivy
  :commands (swiper swiper-backward)
  :general ("C-s" 'swiper))


(use-package counsel
  :ensure t
  :requires ivy
  )

(use-package ivy-rich
  :ensure t
  :requires ivy
  :init
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  :config
  (ivy-rich-mode 1))

(use-package evil
  :ensure t
  :demand t
  :init
  (setq evil-want-integration t) ;; This is optional since it's already set to t by default.
  (setq evil-want-keybinding nil)
  (setq evil-disable-insert-state-bindings t)
  :general
  (general-nmap "C-j" 'evil-window-down)
  (general-nmap "C-k" 'evil-window-up)
  (general-nmap "C-h" 'evil-window-left)
  (general-nmap "C-l" 'evil-window-right)
  ([remap evil-emacs-state] 'evil-normal-state)
  (general-nmap "/" 'swiper)
  (general-nmap "?" 'swiper-backward)
  :config
  (evil-mode 1))

(use-package evil-collection
  :after evil
  :ensure t
  :custom
  (evil-collection-setup-minibuffer t)
  :config
  (evil-collection-init 'minibuffer)
  (evil-collection-init 'helm))

(use-package helm-config
  :general
  ([remap find-file] 'helm-find-files)
  ([remap occur] 'helm-occur)
  ([remap list-buffers] 'helm-buffers-list)
  ([remap dabbrev-expand] 'helm-dabbrev)
  ([remap execute-extended-command] 'helm-M-x)
  :init
  (unless (boundp 'completion-in-region-function)
    (general-def lisp-interaction-mode-map [remap completion-at-point] 'helm-lisp-completion-at-point)
    (general-def emacs-lisp-mode-map       [remap completion-at-point] 'helm-lisp-completion-at-point)))

(use-package helm-mode
  :config
  (helm-mode 1))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t
  :requires (evil magit))

(use-package evil-snipe
  :ensure t
  :demand t
  :requires evil
  :general
  (general-vmap evil-snipe-local-mode-map "z" 'evil-snipe-s)
  (general-vmap 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S)
  :hook (magit-mode . turn-off-evil-snipe-override-mode)
  :custom
  (evil-snipe-scope 'visible)
  (evil-snipe-repeat-scope 'whole-visible)
  (evil-snipe-spillover-scope 'whole-buffer)
  :config
  (evil-snipe-mode +1)
  (evil-snipe-override-mode +1))

(use-package evil-find-char-pinyin
  :ensure t
  :requires (evil evil-snipe)
                                        ; :init
                                        ; (setq evil-find-char-pinyin-only-simplified nil)
  :config
  (evil-find-char-pinyin-toggle-snipe-integration t)
  (evil-find-char-pinyin-mode +1))

(use-package evil-easymotion
  :ensure t
  :requires (evil evil-snipe)
  :general
  (evil-snipe-parent-transient-map (kbd "SPC")
    (evilem-create 'evil-snipe-repeat
                   :bind ((evil-snipe-scope 'buffer)
                          (evil-snipe-enable-highlight)
                          (evil-snipe-enable-incremental-highlight))))
  :config
  (evilem-default-keybindings "SPC"))

(use-package evil-org
  :ensure t
  :requires evil
  :after org
  :hook
  (org-mode . evil-org-mode)
  :config
  (evil-org-set-key-theme)
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (general evil-collection helm ivy-rich counsel gruvbox-theme evil-magit magit org swiper ivy evil-org evil-easymotion evil-find-char-pinyin evil-snipe paradox evil use-package)))
 '(scroll-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
