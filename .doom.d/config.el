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
