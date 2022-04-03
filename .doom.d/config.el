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
