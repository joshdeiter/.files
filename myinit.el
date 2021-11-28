(use-package try
  :ensure t)

(use-package which-key
  :ensure t
  :config
  (which-key-mode))

(use-package keycast
  :ensure t)

(defalias 'list-buffers 'ibuffer) ; make ibuffer default

(use-package ace-window
  :ensure t
  :init
  (progn
    (global-set-key [remap other-window] 'ace-window)
    (custom-set-faces
     '(aw-leading-char-face
       ((t (:inherit ace-jump-face-foreground :height 3.0)))))
    ))

;;Theme related settings
(load-theme 'tango-dark t)

(use-package color-theme-modern
  :ensure t)

(use-package pdf-tools
  :config
  (pdf-tools-install)
  (setq pdf-view-resize-factor 1.1)
  (setq-default pdf-view-display-size 'fit-page)
  )

(use-package org-pdftools
  :hook (org-load-hook . org-pdftools-setup-link)
  )

(use-package aozora-view
  :ensure t)

;; it looks like counsel is a requirement for swiper
(use-package counsel
:ensure t
)

;; Navigation within document
(use-package swiper
  :ensure try
  :config
  (progn
    (ivy-mode 1)
    (setq ivy-use-virtual-buffers t)
    (global-set-key "\C-s" 'swiper)
    (global-set-key (kbd "C-c C-r") 'ivy-resume)
    (global-set-key (kbd "<f6>") 'ivy-resume)
    (global-set-key (kbd "M-x") 'counsel-M-x)
    (global-set-key (kbd "C-x C-f") 'counsel-find-file)
    (global-set-key (kbd "<f1> f") 'counsel-describe-function)
    (global-set-key (kbd "<f1> v") 'counsel-describe-variable)
    (global-set-key (kbd "<f1> l") 'counsel-load-library)
    (global-set-key (kbd "<f2> i") 'counsel-info-lookup-symbol)
    (global-set-key (kbd "<f2> u") 'counsel-unicode-char)
    (global-set-key (kbd "C-c g") 'counsel-git)
    (global-set-key (kbd "C-c j") 'counsel-git-grep)
    (global-set-key (kbd "C-c k") 'counsel-ag)
    (global-set-key (kbd "C-x l") 'counsel-locate)
    (global-set-key (kbd "C-S-o") 'counsel-rhythmbox)
    (define-key read-expression-map (kbd "C-r") 'counsel-expression-history)
    ))

;; Navigation, avy search onscreen character Meta go character
(use-package avy
  :ensure t
  :bind ("M-g c" . avy-goto-char))

;; Completion Frameworks, ido, ivy, helm, counsel, swiper
;;(setq ido-enable-flex-matching t)
;;(setq ido-everywhere t)
;;(ido-mode 1)

;;Tab-completion - Abbrev, Hippie Expand, Dabbrev
;;Auto-completion -  auto-complete Mode, company Mode
;;(use-package auto-complete
;; :ensure t
;; :init
;; (progn
;; (ac-config-default)
;; (global-auto-complete-mode t)
;; ))

(use-package company
  :ensure t
  :init
  (progn
    (add-hook 'after-init-hook 'global-company-mode)
    ))

(use-package org-superstar
  :ensure t
  :config
  (add-hook 'org-mode-hook (lambda () (org-superstar-mode 1))))

(use-package google-translate
  :ensure t)

(use-package osx-dictionary
  :ensure t
  :bind (("C-c d" . osx-dictionary-search-word-at-point)
	 ("C-c i" . osx-dictionary-search-input)
	 ))

(use-package powerthesaurus
  :ensure t)

;; OrgRoam Setup
(use-package org-roam
:ensure t
:init
(setq org-roam-v2-ack t)
:custom
(org-roam-directory "~/OrgRoam")
(org-roam-completion-everywhere t)
(org-roam-capture-templates
 '(("d" "default" plain
    "%?"
    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+date: %U\n ")
    :unnarrowed t)
   ("l" "programming language" plain
    "* Characteristics\n\n- Family: %?\n- Inspired by: \n\n* Reference:\n\n"
    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
    :unnarrowed t)
   ("b" "book notes" plain
    (file "~/OrgRoam/Templates/BookNoteTemplate.org")
    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n")
    :unnarrowed t)
   ("p" "project" plain "* Goals\n\n%?\n\n* Tasks\n\n** TODO Add initial tasks\n\n* Dates\n\n"
    :if-new (file+head "%<%Y%m%d%H%M%S>-${slug}.org" "#+title: ${title}\n#+filetags: Project")
    :unnarrowed t)
    )
    )
   :bind (("C-c n l" . org-roam-buffer-toggle)
       ("C-c n f" . org-roam-node-find)
       ("C-c n i" . org-roam-node-insert)
       :map org-mode-map
       ("C-M-i" . completion-at-point))
  :config
  (org-roam-setup))

(use-package ox-reveal
  :ensure ox-reveal)

(setq org-reveal-root "https://cdn.jsdelivr.net/npm/reveal.js")
(setq org-reveal-mathjax t)

(use-package htmlize
  :ensure t)

(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode t ))

(use-package yasnippet
  :ensure t
  :init
  (yas-global-mode 1))

(use-package magit
  :ensure t)

;;Setting version of Python to be used by Emacs
(setq python-shell-interpreter "python3")

(use-package jedi
  :ensure t
  :init
  (add-hook 'python-mode-hook 'jedi:setup)
  (add-hook 'python-mode-hook 'jedi:ac-setup))

(use-package elpy
  :ensure t
  :config
  (elpy-enable))
