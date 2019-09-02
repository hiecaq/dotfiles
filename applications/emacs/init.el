(set-language-environment "UTF-8")
(prefer-coding-system 'utf-8-unix)
(setq-default indent-tabs-mode nil)

(setq url-proxy-services '(("no_proxy" . "^\\(localhost\\|10\\..*\\|192\\.168\\..*\\)")
                           ("http" . "127.0.0.1:8118")
                           ("https" . "127.0.0.1:8118")))
(setq package-archives '(("gnu"   . "http://mirrors.tuna.tsinghua.edu.cn/elpa/gnu/")
                         ("melpa" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/")
                         ("org" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/org/")))
(setq package-enable-at-startup nil)
(package-initialize) ;; You might already have this line

(eval-when-compile
  (require 'use-package))

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

(use-package evil
  :ensure t
  :config
  (setcdr evil-insert-state-map nil)
  (define-key evil-insert-state-map (read-kbd-macro evil-toggle-key) 'evil-normal-state)
  (define-key evil-insert-state-map [escape] 'evil-normal-state)
  (evil-mode 1))

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
  :bind (("C-s" . swiper))
  :custom
  (ivy-use-virtual-buffers t "add recent files/bookmarks to ivy-switch-buffer")
  (ivy-count-format "(%d/%d) " "the style for displaying current candidate count")
  :config
  (ivy-mode 1))

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
  (add-hook 'magit-mode-hook 'turn-off-evil-snipe-override-mode)
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
  :init
  (add-hook 'org-mode-hook 'evil-org-mode)
  :config
  (add-hook 'evil-org-mode-hook
            (lambda ()
              (evil-org-set-key-theme)))
  (require 'evil-org-agenda)
  (evil-org-agenda-set-keys))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   (quote
    (evil-magit magit org swiper ivy evil-org evil-easymotion evil-find-char-pinyin evil-snipe paradox evil use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
