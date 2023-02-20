;;; ~/.doom.d/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here
(setq doom-font (font-spec :family "Menlo" :size 16))
(add-to-list 'default-frame-alist '(fullscreen . maximized))
(setq display-line-numbers-type 'relative)
(setq display-fill-column-indicator-mode t)

(global-visual-line-mode t)

(add-hook! 'emacs-startup-hook #'doom-init-ui-h)

;; pin eclipse.jdt.ls (newer versions require java 11)
(setq lsp-java-jdt-download-url  "https://download.eclipse.org/jdtls/milestones/0.57.0/jdt-language-server-0.57.0-202006172108.tar.gz")

;; org-mode
;;(setq org-directory "~/org/"
;;      org-agenda-files (list "~/org/"))
;;(setq org-hide-emphasis-markers t)
;;(setq org-log-done 'time)
;;(setq org-log-into-drawer t)
;;(setq org-log-reschedule 'time)

;;(zz/add-file-keybinding "C-c z i" "~/org/ideas.org" "ideas.org")
;;(zz/add-file-keybinding "C-c z o" "~/org/organizer.org" "organizer.org")
;;(zz/add-file-keybinding "C-c z b" "~/org/books.org" "books.org")
;;(zz/add-file-keybinding "C-c z h" "~/org/habits.org" "habits.org")

;;(add-hook 'org-mode-hook 'visual-line-mode)
;;(add-hook 'org-mode-hook #'visual-line-mode)

;;(setq org-capture-templates
;;  (quote
;;    (("p" "Private templates")
;;     ("pt" "TODO entry" entry
;;       (file+headline "~/org/private.org" "Capture")
;;       (file "~/org/tpl-todo.txt"))
;;     ("pr" "Add paper to read" entry
;;       (file+headline "~/org/private.org" "Papers to read")
;;       (file "~/org/tpl-paper.txt") :empty-lines-after 2)
;;     ("pb" "Add book to read" entry
;;       (file+headline "~/org/private.org" "Books to read")
;;       (file "~/org/tpl-book.txt") :empty-lines-after 2))))



;;(global-set-key "\C-ca" 'org-agenda)
;;(global-set-key (kbd "<f6>") 'org-capture)

;;(use-package! org-archive
;;  :after org
;;  :config
;;  (setq org-archive-location "archive.org::datetree/"))
;;
;;(after! org
;;  (add-to-list 'org-modules 'org-habit))
;;
;;(after! org-habit
;;  (setq org-habit-show-all-today nil
;;        org-habit-show-habits  t))
;;
;;(custom-set-faces
;;  '(org-level-1 ((t (:inherit outline-1 :height 1.0)))))
;;
;;(use-package! org-cliplink)

;;(use-package ammonite-term-repl)
;;  (setq ammonite-term-repl-program-args '("--no-remote-logging" "--no-default-predef" "--no-home-predef"))

;;(org-agenda-list)
