;; turn on font-lock mode
(global-font-lock-mode t)

;;to set the cursor color
(set-cursor-color "red")

;;to set foreground color to white
(set-foreground-color "grey80")

;;to set background color to black
(set-background-color "black")

;; set default font
(set-face-attribute 'default nil :family "Inconsolata" :height 110)

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
+
(server-start)

(setenv "PATH" (concat "C:\\Program Files\\Git\\bin;" (getenv "PATH")))
(setq shell-file-name "c:/Program Files/Git/bin/sh.exe")

(add-to-list 'load-path
              "~/.emacs.d/plugins")
(require 'yasnippet-bundle)
(require 'emacsd-tile)
(require 'google-c-style)
(require 'etags-select)
(require 'browse-kill-ring)
(browse-kill-ring-default-keybindings)

(when (> emacs-major-version 21)
  (global-set-key [C-pause] 'previous-buffer)
  (global-set-key [M-pause] 'next-buffer))

+(defun etags-select-get-tag-files ()
    "Get tag files."
    (if etags-select-use-xemacs-etags-p
        (buffer-tag-table-list)
      (mapcar 'tags-expand-table-name tags-table-list)
      (tags-table-check-computed-list)
      tags-table-computed-list))

;;binding the key
(global-set-key "\M-?" 'etags-select-find-tag-at-point)
(global-set-key "\M-." 'etags-select-find-tag)


(defun jds-find-tags-file ()
  "recursively searches each parent directory for a file named 'TAGS' and returns the
path to that file or nil if a tags file is not found. Returns nil if the buffer is
not visiting a file"
  (progn
      (defun find-tags-file-r (path)
         "find the tags file from the parent directories"
         (let* ((parent (file-name-directory path))
                (possible-tags-file (concat parent "TAGS")))
           (cond
             ((file-exists-p possible-tags-file) (throw 'found-it possible-tags-file))
             ((string= "/TAGS" possible-tags-file) (error "no tags file found"))
             (t (find-tags-file-r (directory-file-name parent))))))

    (if (buffer-file-name)
        (catch 'found-it 
          (find-tags-file-r (buffer-file-name)))
        (error "buffer is not visiting a file"))))

(defun jds-set-tags-file-path ()
  "calls `jds-find-tags-file' to recursively search up the directory tree to find
a file named 'TAGS'. If found, set 'tags-table-list' with that path as an argument
otherwise raises an error."
  (interactive)
  (setq tags-table-list (list (jds-find-tags-file))))

;; delay search the TAGS file after open the source file
(add-hook 'emacs-startup-hook 
	  '(lambda () (jds-set-tags-file-path)))

(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 '(column-number-mode t)
 '(show-paren-mode t))
