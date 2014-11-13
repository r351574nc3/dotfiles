; -*-emacs-lisp-*-

;;
;; My .emacs:
;; Leo Przybylski (przybyls@arizona.edu)
;;

;; My info
;;
(setq user-full-name "Leo Przybylski")
(setq user-mail-address "r351574nc3@gmail.com")
(setq-default indent-tabs-mode nil); 
(setq default-tab-width 4)
;; (require 'setnu)
;; (require 'uim-leim)
;; (setq default-input-method "korean-hangul2-uim")

;; Set the short-cut keys
;;
(define-key global-map [f1] (lambda ()
(interactive)
(manual-entry (current-word))))
;; (autoload 'setnu-mode "setnu+" "Toggle setnu-mode on/off." t)
;; (define-key global-map [f2] 'find-file) ;; F2 - OPEN
;; (define-key global-map [f3] 'kill-buffer-fast) ;; F3 - CLOSE
;; (define-key global-map [f4] 'goto-line) ;; F4 - GOTO LINE
;; (define-key global-map [f5] 'other-window)
;; (define-key global-map [f7] 'replace-string) ;; F7 - REPLACE
(define-key global-map [f9] 'undo) ;; F9 - UNDO
;; (define-key global-map [f10] 'compile) ;; F10 - COMPILE
;; (define-key global-map [f11] 'next-error) ;; F11 - NEXT ERROR
;; (define-key global-map [f12] 'add-change-log-entry-other-window) ;; F12 - CHANGE LOG
(require 'package)
        (add-to-list 'package-archives
                     '("melpa" . "http://melpa.milkbox.net/packages/") t)
        (package-initialize)
        (unless (package-installed-p 'scala-mode2)
          (package-refresh-contents) (package-install 'scala-mode2))

(defvar emacs-directory "~/.emacs.d/")

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(auto-revert-interval 2)
 '(auto-revert-stop-on-user-input nil)
 '(browse-url-browser-function (quote w3m-browse-url))
 '(c-basic-offset 4)
 '(c-default-style "K&R")
 '(c-progress-interval 8)
 '(column-number-mode t)
 '(compilation-ask-about-save nil)
 '(compilation-scroll-output t)
 '(compilation-window-height 6)
 '(delete-old-versions t)
 '(font-lock-global-modes t)
 '(font-lock-maximum-decoration t)
 '(global-auto-revert-mode t nil (autorevert))
 '(global-font-lock-mode t nil (font-lock))
 '(indent-tabs-mode nil)
 '(invert-face-mode "default")
 '(next-line-add-newlines nil)
 '(sgml-basic-offset 4)
 '(standard-indent 4)
 '(tool-bar-mode nil)
 '(scroll-bar-mode nil))

(setq-default truncate-lines 1)
(set-default-font "-microsoft-Consolas-normal-italic-normal-*-18-*-*-*-m-0-iso10646-1")
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(defvar autosave-dir
 (concat "~/tmp/emacs_autosaves/" (user-login-name) "/"))

(make-directory autosave-dir t)

(defun auto-save-file-name-p (filename)
  (string-match "^#.*#$" (file-name-nondirectory filename)))

(defun make-auto-save-file-name ()
  (concat autosave-dir
   (if buffer-file-name
      (concat "#" (file-name-nondirectory buffer-file-name) "#")
    (expand-file-name
     (concat "#%" (buffer-name) "#")))))

;; Put backup files (ie foo~) in one place too. (The backup-directory-alist
;; list contains regexp=>directory mappings; filenames matching a regexp are
;; backed up in the corresponding directory. Emacs will mkdir it if necessary.)
(defvar backup-dir (concat "~/tmp/emacs_backups/" (user-login-name) "/"))
(setq backup-directory-alist (list (cons "." backup-dir)))
