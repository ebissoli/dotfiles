;; -*- no-byte-compile: t; -*-
;;; $DOOMDIR/packages.el

;; To install a package with Doom you must declare them here and run 'doom sync'
;; on the command line, then restart Emacs for the changes to take effect -- or
;; use 'M-x doom/reload'.


;; To install SOME-PACKAGE from MELPA, ELPA or emacsmirror:
;(package! some-package)

;; To install a package directly from a remote git repo, you must specify a
;; `:recipe'. You'll find documentation on what `:recipe' accepts here:
;; https://github.com/raxod502/straight.el#the-recipe-format
;(package! another-package
;  :recipe (:host github :repo "username/repo"))

;; If the package you are trying to install does not contain a PACKAGENAME.el
;; file, or is located in a subdirectory of the repo, you'll need to specify
;; `:files' in the `:recipe':
;(package! this-package
;  :recipe (:host github :repo "username/repo"
;           :files ("some-file.el" "src/lisp/*.el")))

;; If you'd like to disable a package included with Doom, you can do so here
;; with the `:disable' property:
;(package! builtin-package :disable t)

;; You can override the recipe of a built in package without having to specify
;; all the properties for `:recipe'. These will inherit the rest of its recipe
;; from Doom or MELPA/ELPA/Emacsmirror:
;(package! builtin-package :recipe (:nonrecursive t))
;(package! builtin-package-2 :recipe (:repo "myfork/package"))

;; Specify a `:branch' to install a package from a particular branch or tag.
;; This is required for some packages whose default branch isn't 'master' (which
;; our package manager can't deal with; see raxod502/straight.el#279)
;(package! builtin-package :recipe (:branch "develop"))

;; Use `:pin' to specify a particular commit to install.
;(package! builtin-package :pin "1a2b3c4d5e")


;; Doom's packages are pinned to a specific commit and updated from release to
;; release. The `unpin!' macro allows you to unpin single packages...
;(unpin! pinned-package)
;; ...or multiple packages
;(unpin! pinned-package another-pinned-package)
;; ...Or *all* packages (NOT RECOMMENDED; will likely break things)
;(unpin! t)

; (package! org-roam-bibtex
;   :recipe (:host github :repo "org-roam/org-roam-bibtex"))

;; ;; When using org-roam via the `+roam` flag
; (unpin! org-roam company-org-roam)

;; ;; When using bibtex-completion via the `biblio` module
; (unpin! bibtex-completion helm-bibtex ivy-bibtex)


;; (package! mathpix.el
;;   :recipe (:host github :repo "jethrokuan/mathpix.el"))
;  :custom ((mathpix-app-id "enzogurgel15_gmail_com_46b290_4aff5e")
;           (mathpix-app-key "b27089134db4c80fef3b"))
;  :bind
;  ("C-x m" . mathpix-screenshot))

;; (package! org-drill)
 
;(package! org-roam-server)
;; (package! literate-calc-mode)
(package! keycast-mode
  :recipe (:host github :repo "tarsius/keycast"))
;; (package! auto-yasnippet)

(package! verilog-mode)
(package! spice-mode
  :recipe (:host github :repo "emacsmirror/spice-mode"))
(package! ob-spice
  :recipe (:host github :repo "fpiper/ob-spice"))
(package! matlab-mode)
(package! nov)
;;(package! persist)
;; (package! org-gcal)
(package! request)
(package! alert)
(package! org-super-agenda)
;; (package! org-gtd)
;; (package! org-ref)
;; (package! zotxt)

 ;; (package! evil-motion-trainer
 ;;   :recipe (:host github :repo "martinbaillie/evil-motion-trainer"))
(package! calibredb
  :recipe (:host github :repo "chenyanming/calibredb.el"))
;; (package! org-xournalpp
;;   :recipe (:host gitlab
;;            :repo "vherrmann/org-xournalpp"
;;            :files ("resources" "*.el")))

(package! ob-sml
  :recipe (:host github :repo "swannodette/ob-sml"))
;; (package! pyret
;;   :recipe (:host github :repo "brownplt/pyret-lang/tools/emacs/"
;;            :files ("pyret-debgu-mode.el" "pyret.el")))
;; (package! elcord)
;; (package! good-scroll)
(package! platformio-mode)
(package! burly)
 (package! org-ql)
;; (package! org-alert
;;   :recipe (:host github :repo "spegoraro/org-alert"))
;; (package! org-wild-notifier)
;; (package! org-notify
;;   :recipe (:host github :repo "tkf/org-mode"
;;            :files ("contrib/lisp/org-notify.el")))
;; (package! org-notifications)
;; (package! org-notify
;;   :recipe (:host github :repo "p-m/org-notify"))
;; (package! nasm-mode
;;          :recipe (:host github :repo "skeeto/nasm-mode"))
(package! graphviz-dot-mode)
(unpin! org-roam)
(package! org-roam-ui)
;;(package! org-notify)
;;(package! csv-mode)
;;(package! xwwp)
;;(package! webkit
;;  :recipe (:host github
;;           :repo "akirakyle/emacs-webkit"))
(package! mu4e-alert :disable t)
(package! telega)
(package! doct)
