;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-

;; Place your private configuration here! Remember, you do not need to run 'doom
;; sync' after modifying this file!


;; Some functionality uses this to identify you, e.g. GPG configuration, email
;; clients, file templates and snippets. It is optional.
(setq user-full-name "Zauberin"
      user-mail-address "belfieldcecil@gmail.com")

;; Doom exposes five (optional) variables for controlling fonts in Doom:
;;
;; - `doom-font' -- the primary font to use
;; - `doom-variable-pitch-font' -- a non-monospace font (where applicable)
;; - `doom-big-font' -- used for `doom-big-font-mode'; use this for
;;   presentations or streaming.
;; - `doom-unicode-font' -- for unicode glyphs
;; - `doom-serif-font' -- for the `fixed-pitch-serif' face
;;
;; See 'C-h v doom-font' for documentation and more examples of what they
;; accept. For example:
;;
;;(setq doom-font (font-spec :family "Fira Code" :size 12 :weight 'semi-light)
;;      doom-variable-pitch-font (font-spec :family "Fira Sans" :size 13))
;;
;; If you or Emacs can't find your font, use 'M-x describe-font' to look them
;; up, `M-x eval-region' to execute elisp code, and 'M-x doom/reload-font' to
;; refresh your font settings. If Emacs still can't find your font, it likely
;; wasn't installed correctly. Font issues are rarely Doom issues!

;; There are two ways to load a theme. Both assume the theme is installed and
;; available. You can either set `doom-theme' or manually load a theme with the
;; `load-theme' function. This is the default:
(setq doom-theme 'doom-monokai-classic
      doom-font (font-spec :family "Hack" :size 12 :weight 'medium))

;; Kill buffer command
(global-set-key (kbd "C-x k") 'kill-current-buffer)
;; Indent region
(global-set-key (kbd "C-c i") 'indent-region)
(+global-word-wrap-mode)
(if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
    (setq projectile-project-search-path '("C:/Users/dillona/Documents/projects"
                                           "C:/Users/dillona/Documents/msys2640/home/dillona/mapupdate"
                                           ("C:/Git" . 1)))
    (setq projectile-project-search-path '(("~/Documents/GitHub" . 1))))

;; Eshell config
(global-set-key (kbd "C-x e") #'eshell)
(add-hook 'eshell-mode-hook (lambda ()
    ; Quick switch to org
    (eshell/alias "so"
        (if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
            "cd C:/org/org-notes"
            "cd ~/Documents/GitHub/org-notes"))
    ; Opening files
    (eshell/alias "e" "find-file $1")
    (eshell/alias "ff" "find-file $1")
    (eshell/alias "emacs" "find-file $1")
    (eshell/alias "ee" "find-file-other-window $1")
    ; Open in explorer
    (eshell/alias "ex" "explorer .")
    ; Git
    (eshell/alias "gd" "magit-diff-unstaged")
    (eshell/alias "gds" "magit-diff-staged")
    ; Dired
    (eshell/alias "d" "dired .")
    ; The 'ls' executable requires the Gnu version on the Mac
    (let ((ls (if (file-exists-p "/usr/local/bin/gls")
                  "/usr/local/bin/gls"
                "ls")))
      (eshell/alias "ll" (concat ls " -AlohG --color=always")))))
(add-hook 'eshell-mode-hook (lambda ()
    (eshell/alias "iscc" "C:/Program Files (x86)/Inno Setup 6/ISCC /Q /O-")
    (eshell/alias "sp" "cd C:/Users/dillona/Documents/projects")
    (eshell/alias "spp" "cd C:/Users/dillona/Documents/projects/0tools/python")
    (eshell/alias "sl" "cd C:/Git/leos")
    (eshell/alias "sli" "cd C:/Git/dct_installer")
    (eshell/alias "slt" "cd C:/Git/location_tool")
    (eshell/alias "slti" "cd C:/Git/map_updater")
    (eshell/alias "si" "cd C:/Git/web_framework")
    (eshell/alias "ss" "cd C:/Git/sara")
    (eshell/alias "st" "cd C:/Git/ibars_report_templates")
    (eshell/alias "sm" "cd C:/Users/dillona/mapupdate")))

(if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)) (set-register ?g (find-file (or "C:/Users/dillona/agsdb.ini" ""))))
(if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)) (set-register ?h (find-file (or "C:/Users/dillona/leos_agsdb.ini" ""))))
(if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt)) (set-register ?i (find-file (or "C:/Users/dillona/lt_config.xml" ""))))

;; This determines the style of line numbers in effect. If set to `nil', line
;; numbers are disabled. For relative line numbers, set this to `relative'.
(setq display-line-numbers-type 'relative)

;; If you use `org' and don't want your org files in the default location below,
;; change `org-directory'. It must be set before org loads!
(if (or (eq system-type 'ms-dos) (eq system-type 'windows-nt))
    (setq org-directory '"C:/org/org-notes")
    (setq org-directory '"~/Documents/GitHub/org-notes"))

;; Org keybinds
(map! :after org
      :map org-mode-map
      "C-c ." 'org-time-stamp
      "C-c x" 'org-cut-subtree)
(global-set-key (kbd "C-c l") #'org-store-link)
(global-set-key (kbd "C-c a") #'org-agenda)
(global-set-key (kbd "C-c c") #'org-capture)

;; Org capture templates
(after! org
        (setq org-enforce-todo-dependencies t
              org-tag-persistent-alist '((:startgroup . nil)
                                         ("@dct" . ?d)
                                         ("@lt" . ?l)
                                         ("@ibars" . ?i)
                                         ("@sara" . ?s)
                                         ("@pivots" . ?p)
                                         ("@other" . ?o)
                                         ("@home" . ?h)
                                         (:endgroup . nil)
                                         ("cuervo-burrito" . ?c)
                                         ("side-project" . ?r)
                                         ("emacs" . ?e)
                                         ("tracs" . ?t)
                                         ("nd")
                                         ("sd")
                                         ("ks")
                                         ("nj")
                                         (:startgroup . nil)
                                         ("p1" . ?1)
                                         ("p2" . ?2)
                                         ("p3" . ?3)
                                         ("p4" . ?4)
                                         ("p5" . ?5)
                                         (:endgroup . nil))
              org-enfocre-todo-checkbox-dependencies t
              org-todo-keywords '((sequence "TODO" "IN-PROGRESS" "WAITING" "|" "DONE" "CLOSED"))
              org-todo-state-tags-triggers '(("CLOSED" ("ARCHIVE" . t)))
              org-agenda-include-diary t
              org-log-done 'time
              diary-file (concat org-directory "/diary")
              org-journal-dir (concat org-directory "/journal")
              org-journal-file-format "%Y-%m.org"
              org-journal-file-type 'monthly
              ;; Set default directories, files
              org-default-notes-file (concat org-directory "/inbox.org")
              org-work-file (concat org-directory "/work.org")
              org-home-file (concat org-directory "/home.org")
              org-capture-templates '(("t" "Inbox" entry (file+headline org-default-notes-file "Inbox")
                                       "* TODO %?\nDEADLINE: \n:PROPERTIES:\n:CREATION: %U\n:END:\n")
                                      ("i" "Work Issue" entry (file+headline org-work-file "Inbox")
                                       "* TODO %?\nDEADLINE: \n:PROPERTIES:\n:CREATION: %U\n:TRACKZILLA: N/A\n:END:\n")
                                      ("h" "Home Task" entry (file+headline org-home-file "Tasks")
                                       "* TODO %?\nDEADLINE: \n:PROPERTIES:\n:CREATION: %U\n:END:\n")
                                      ("j" "Journal" entry (file+datetree org-default-notes-file)
                                       "* %?\n%U\n%a")
                                      ("n" "Link Inbox" entry (file+headline org-default-notes-file "Inbox")
                                       "* TODO %?\nDEADLINE: \n:PROPERTIES:\n:CREATION: %U\n:END:\n%a")
                                      ("o" "Link Work Issue" entry (file+headline org-work-file "Inbox")
                                       "* TODO %?\nDEADLINE: \n:PROPERTIES:\n:CREATION: %U\n:END:\n%a")
                                      ("m" "Link Home Task" entry (file+headline org-home-file "Tasks")
                                       "* TODO %?\nDEADLINE: \n:PROPERTIES:\n:CREATION: %U\n:END:\n%a"))))

;; Whenever you reconfigure a package, make sure to wrap your config in an
;; `after!' block, otherwise Doom's defaults may override your settings. E.g.
;;
;;   (after! PACKAGE
;;     (setq x y))
;;
;; The exceptions to this rule:
;;
;;   - Setting file/directory variables (like `org-directory')
;;   - Setting variables which explicitly tell you to set them before their
;;     package is loaded (see 'C-h v VARIABLE' to look up their documentation).
;;   - Setting doom variables (which start with 'doom-' or '+').
;;
;; Here are some additional functions/macros that will help you configure Doom.
;;
;; - `load!' for loading external *.el files relative to this one
;; - `use-package!' for configuring packages
;; - `after!' for running code after a package has loaded
;; - `add-load-path!' for adding directories to the `load-path', relative to
;;   this file. Emacs searches the `load-path' when you load packages with
;;   `require' or `use-package'.
;; - `map!' for binding new keys
;;
;; To get information about any of these functions/macros, move the cursor over
;; the highlighted symbol at press 'K' (non-evil users must press 'C-c c k').
;; This will open documentation for it, including demos of how they are used.
;; Alternatively, use `C-h o' to look up a symbol (functions, variables, faces,
;; etc).
;;
;; You can also try 'gd' (or 'C-c c d') to jump to their definition and see how
;; they are implemented.
