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


