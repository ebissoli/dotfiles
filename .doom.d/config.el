;; Some functionality uses this to identify you, e.g. GPG configuration, email clients, file templates and snippets.
(setq user-full-name "Enzo Bissoli"
      user-mail-address "enzogurgel15@gmail.com")
;; Doom exposes five (optional) variables for controlling fonts in Doom. Here
;; are the three important ones:
;;
;; -*- lexical-binding: t; -*-
;; + `doom-font'
;; + `doom-variable-pitch-font'
;; + `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;;
;; They all accept either a font-spec, font string ("Input Mono-12"), or xlfd
;; font string. You generally only need these two
(setq doom-font (font-spec :family "Anonymice Nerd Font" :size 14 :weight 'regular) ;; use :weight parameter for something other than regular
      doom-variable-pitch-font (font-spec :family "Anonymice Nerd Font" :size 14 :weight 'regular))

(setq doom-unicode-font (font-spec :family "DM Mono"))
;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'modus-operandi)

(setq display-line-numbers-type t)

(remove-hook 'org-mode-hook #'org-superstar-mode) ;;basic doom emacs


(setq display-line-numbers-type t) ;; basic -doom -config

(after! org
  (setq org-fontify-quote-and-verse-blocks nil
        org-fontify-whole-heading-line nil
        ;; org-hide-leading-stars nil
        org-startup-indented nil))

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!

(setq org-directory "~/Insync/enzogurgel15@gmail.com/Google Drive/org/")
(setq org-noter-notes-search-path '("~/Insync/enzogurgel15@gmail.com/Google Drive/org/")) ;;basic org config

(use-package deft
  :after org
  :custom
  (deft-recursive t)
  (deft-use-filter-string-for-filename t)
  (deft-default-extension "org")
  (deft-directory "~/Insync/enzogurgel15@gmail.com/Google Drive/org/")) ;;notetaking-deft

;; Function to calculate relative day to today

(progn
 (add-hook! 'org-agenda-mode-hook :append :local #'org-agenda-day-view)
 (org-agenda-list)
 (setq org-agenda-skip-deadline-if-scheduled 't)
 (defun timeFrwd (timefrwd) (format-time-string "%Y-%m-%d" (org-read-date nil t (concat "+" timefrwd))))
 (setq org-super-agenda-groups
            `(
              (
               :discard (:regexp "W3"))
              (:name "Overdue"
                     :deadline past
                     :order 0)
              (:name "Tasks for today"
                     :not (:tag "KOLB")
                     :scheduled (before ,(timeFrwd "+1d"))
                     :order 1)
              (:name "Due in near future"
                     :not (:tag "KOLB")
                     :deadline (before ,(timeFrwd "+6d"))
                     :order 2)
              (:name "Meeting & Events"
                     :tag "MEETING"
                     :order 3)
              (:name "Tests"
                     :tag "TESTS"
                     :priority> "B"
                     :order 4)
              (:name "Goals"
                     :tag "GOAL"
                     :priority> "B"
                     :order 5)
              (:name "Current Kolby's Cyle"
                     :tag "KOLB"
                     :order 6)
              ))
 (org-super-agenda-mode))

(setq org-roam-directory "~/Insync/enzogurgel15@gmail.com/Google Drive/org/")
(setq org-roam-completion-everywhere t)
(require 'org-roam-protocol)
 (setq org-roam-capture-ref-templates
	'(("i" "internet" plain #'org-roam-capture--get-point "%?"
	   :file-name "float/%<%Y%m%d%H%M>-${slug}"
	   :head "#+title: ${title}\n#+roam_key: ${ref}\n#+roam_tags: bookmark"
	   :unnarrowed t)))

(use-package! websocket
    :after org-roam)

(use-package! org-roam-ui
    :after org-roam ;; or :after org
;;         normally we'd recommend hooking orui after org-roam, but since org-roam does not have
;;         a hookable mode anymore, you're advised to pick something yourself
;;         if you don't care about startup time, use
;;  :hook (after-init . org-roam-ui-mode)
    :config
    (setq org-roam-ui-sync-theme t
          org-roam-ui-follow t
          org-roam-ui-update-on-save t
          org-roam-ui-open-on-start t))

(after! mu4e
  (setq sendmail-program (executable-find "msmtp")
        send-mail-function #'smtpmail-send-it
        message-sendmail-f-is-evil t
        message-sendmail-extra-arguments '("--read-envelope-from")
        message-send-mail-function #'message-send-mail-with-sendmail))

(set-email-account! "1enzogurgel15@gmail.com"
  '((mu4e-sent-folder       . "/gmail/Sent Mail")
    (mu4e-drafts-folder     . "/gmail/Drafts")
    (mu4e-trash-folder      . "/gmail/Trash")
    (mu4e-refile-folder     . "/gmail/All Mail")
    (smtpmail-smtp-user     . "enzogurgel15@gmail.com")
    (mu4e-compose-signature . "---\n---/n/-------"))
  t)

(set-email-account! "2egb2@cin.ufpe.br"
  '((mu4e-sent-folder       . "/CIn/Sent Mail")
    (mu4e-drafts-folder     . "/CIn/Drafts")
    (mu4e-trash-folder      . "/CIn/Trash")
    (mu4e-refile-folder     . "/CIn/All Mail")
    (smtpmail-smtp-user     . "egb2@cin.ufpe.br")
    (mu4e-compose-signature . "---\n Tenha um ótimo dia--"))
  t)

(setq +mu4e-gmail-accounts '(("enzogurgel15@gmail.com" . "/gmail/")
                             ("egb2@cin.ufpe.br" . "/CIn/")))

(setq mu4e-context-policy 'ask-if-none
      mu4e-compose-context-policy 'always-ask)

(setq mu4e-index-cleanup nil
      ;; because gmail uses labels as folders we can use lazy check since
      ;; messages don't really "move"
      mu4e-index-lazy-check t)

;; active Babel languages
(org-babel-do-load-languages
 'org-babel-load-languages
 '(
   (gnuplot . t)
   (spice .t)
   (matlab . t)
   (maxima . t)
   (gnuplot .t)
   (octave .t)
   (jupyter .t)
   (sml . t)
   (haskell .t)
   )
 ) ;; programming -org-babel

(defun my-preview-latex ()
  "Preview LaTeX from the current cell in a separate buffer.

Handles only markdown and code cells, but both in a bit different
ways: on the former, its input is being rendered, while on the
latter - its output."
  (interactive)
  (let* ((cell (ein:worksheet-get-current-cell))
	 (text-to-render
	  (cond ((ein:markdowncell-p cell) (slot-value cell :input))
		((ein:codecell-p cell)
		 (plist-get (car (cl-remove-if-not
				  (lambda (e) (string= (plist-get e :name) "stdout"))
				  (slot-value cell :outputs)))
			    :text))
		(t (error "Unsupported cell type"))))
	 (buffer (get-buffer-create " *ein: LaTeX preview*")))
    (with-current-buffer buffer
      (when buffer-read-only
	(toggle-read-only))
      (unless (= (point-min) (point-max))
	(delete-region (point-min) (point-max)))
      (insert text-to-render)
      (goto-char (point-min))
      (org-mode)
      (org-toggle-latex-fragment 16)
      (special-mode)
      (unless buffer-read-only
	(toggle-read-only))
      (display-buffer
       buffer
       '((display-buffer-below-selected display-buffer-at-bottom)
         (inhibit-same-window . t)))
      (fit-window-to-buffer (window-in-direction 'below))))) ;;programming - auctex


(setq +latex-viewers '(pdf-tools)) ;; programming -latex

;; lsp-julia config
(setq lsp-julia-package-dir nil)
(setq lsp-julia-default-environment "~/.julia/environments/v1.0") ;; programming - julia

(use-package! zig-mode
  :hook ((zig-mode . lsp-deferred))
  :custom (zig-format-on-save nil)
  :config
  (after! lsp-mode
    (add-to-list 'lsp-language-id-configuration '(zig-mode . "zig"))
    (lsp-register-client
      (make-lsp-client
        :new-connection (lsp-stdio-connection "/home/enzobissoli/zls/zls")
        :major-modes '(zig-mode)
        :server-id 'zls)))) ;; programming zig, can remove?


(setq lsp-zig-zls-executable "~/.local/bin/zls") ;; programming - zig

(set-docsets! 'c-mode "C")

(set-docsets! 'sh-mode "Bash")

(add-to-list 'load-path "/usr/bin/maxima/")
(autoload 'maxima-mode "maxima" "Maxima mode" t)
(autoload 'imaxima "imaxima" "Frontend for maxima with Image support" t)
(autoload 'maxima "maxima" "Maxima interaction" t)
(autoload 'imath-mode "imath" "Imath mode for math formula input" t)
(setq imaxima-use-maxima-mode-flag t)
(add-to-list 'auto-mode-alist '("\\.ma[cx]\\'" . maxima-mode))
(matlab-cedet-setup) ;;programming -maxima

(setq exec-path (cons "/usr/local/SMLROOT/bin"  exec-path)) ;; programing sml

(set-docsets! 'matlab-mode "MATLAB") ;; programming - misc, docsets?

(require 'platformio-mode)

;; Enable ccls for all c++ files, and platformio-mode only
;; when needed (platformio.ini present in project root).
(add-hook 'c++-mode-hook (lambda ()
                           (lsp-deferred)
                           (platformio-conditionally-enable)))

(setq ranger-cleanup-on-disable t) ;; apps - dired

(setq delete-by-moving-to-trash t) ;; emergency trash can
