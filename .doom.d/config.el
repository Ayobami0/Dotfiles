;;; $DOOMDIR/config.el -*- lexical-binding: t; -*-


;;SETTINGS
(setq user-full-name "Ayobami Oludemi"
      user-mail-address "oludemiayobami@gmail.com")

(setq doom-font (font-spec :family "FiraCode Nerd Font" :size 12 :weight 'semi-light)
     doom-variable-pitch-font (font-spec :family "NotoSans" :size 13))

(setq doom-theme 'doom-rose-pine)

(setq display-line-numbers-type 'relative)

(setq org-directory "~/org/")

;; PACKAGES
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
(after! company
  ;; Start completion immediately
  (setq company-minimum-prefix-length 1)

  ;; Eliminate delay before completion popup appears
  (setq company-idle-delay 0.0)
)

(after! corfu
  (setq corfu-auto-prefix 1)
)
