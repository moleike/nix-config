;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.

(package! lean4-mode
  :recipe (:host github
           :repo "leanprover-community/lean4-mode"
           :files ("*.el" "data"))
  :pin "1388f9d1429e38a39ab913c6daae55f6ce799479")

(package! remark-mode
  :recipe (:host github
           :repo "torgeir/remark-mode.el")
  :pin "5a2a702d2af8fd007ae02237d5824356d0c1acc6")
