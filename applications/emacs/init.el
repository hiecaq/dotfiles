;; coding
(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8-unix)
;; ui
(tool-bar-mode -1)
(menu-bar-no-scroll-bar)
(setq-default indent-tabs-mode nil)

(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(setq package-enable-at-startup nil)
(package-initialize) ;; You might already have this line

(eval-when-compile
  (require 'use-package))

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
  :bind (("C-c l" . org-store-link)
         ("C-c a" . org-agenda)
         ("C-c c" . org-capture)))

(use-package ivy
  :ensure t
  :custom
  (ivy-use-virtual-buffers t "add recent files/bookmarks to ivy-switch-buffer")
  (ivy-count-format "(%d/%d) " "the style for displaying current candidate count")
  ;; (enable-recursive-minibuffers t "allow minibuffer cmd in minibuffer")
  :config
  (ivy-mode 1))

(use-package swiper
  :ensure t
  :requires ivy
  :commands (swiper swiper-backward)
  :bind (("C-s" . swiper))
  :custom
  (ivy-use-virtual-buffers t "add recent files/bookmarks to ivy-switch-buffer")
  (ivy-count-format "(%d/%d) " "the style for displaying current candidate count")
  :config
  (ivy-mode 1))

(use-package counsel
  :ensure t
  :requires ivy
  :config
  (counsel-mode 1))

(use-package ivy-rich
  :ensure t
  :requires ivy
  :init
  (setcdr (assq t ivy-format-functions-alist) #'ivy-format-function-line)
  :config
  (ivy-rich-mode 1))

(use-package evil
  :ensure t
  :config
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map (read-kbd-macro evil-toggle-key) 'evil-normal-state)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (define-key evil-normal-state-map "/" 'swiper)
  (define-key evil-normal-state-map "?" 'swiper-backward)
  (define-key evil-normal-state-map "\C-j" 'evil-window-down)
  (define-key evil-normal-state-map "\C-k" 'evil-window-up)
  (define-key evil-normal-state-map "\C-h" 'evil-window-left)
  (define-key evil-normal-state-map "\C-l" 'evil-window-right)
  (evil-mode 1))

(use-package magit
  :ensure t)

(use-package evil-magit
  :ensure t
  :requires (evil magit))

(use-package evil-snipe
  :ensure t
  :requires evil
  :init
  (evil-define-key 'visual evil-snipe-local-mode-map "z" 'evil-snipe-s)
  (evil-define-key 'visual evil-snipe-local-mode-map "Z" 'evil-snipe-S)
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
  :config
  (evilem-default-keybindings "SPC")
  (define-key evil-snipe-parent-transient-map (kbd "SPC")
    (evilem-create 'evil-snipe-repeat
                   :bind ((evil-snipe-scope 'buffer)
                          (evil-snipe-enable-highlight)
                          (evil-snipe-enable-incremental-highlight)))))

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
    (ivy-rich counsel gruvbox-theme evil-magit magit org swiper ivy evil-org evil-easymotion evil-find-char-pinyin evil-snipe paradox evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
