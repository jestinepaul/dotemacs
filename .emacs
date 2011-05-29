;; turn on font-lock mode
(global-font-lock-mode t)

;;to set the cursor color
(set-cursor-color "red")

;;to set foreground color to white
(set-foreground-color "grey80")

;;to set background color to black
(set-background-color "black")

;; set default font
(set-face-attribute 'default nil :family "Inconsolata" :height 140)

;; set comment font properties
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(font-lock-comment-face ((t (:foreground "firebrick1" :slant italic :height 140 :family "Optima")))))


;; Display the line and column number in the modeline
(setq line-number-mode t)
(setq column-number-mode t)
(line-number-mode t)
(column-number-mode t)

;; Switching
(iswitchb-mode 1)
(icomplete-mode 1)

;; Don't display the 'Welcome to GNU Emacs' buffer on startup
(setq inhibit-startup-message t)

;; Don't insert instructions in the *scratch* buffer
(setq initial-scratch-message nil)

;; I use version control, don't annoy me with backup files everywhere
(setq make-backup-files nil)
(setq auto-save-default nil)

;; Ask me whether to add a final newline to files which don't have one
(setq require-final-newline 'ask)

;;;; User info
(setq user-full-name "Jestine Paul")
(setq user-mail-address "jestine.paul@gmail.com")


;;;; Indenting

;; Use spaces, not tabs
(setq indent-tabs-mode nil)
(setq-default indent-tabs-mode nil)

;; Use 4 spaces
(setq default-tab-width 4)
(setq tab-width 4)
