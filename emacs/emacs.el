(setq linum-format "%4d \u2502 ")
(if (functionp 'tool-bar-mode) (tool-bar-mode 0))
(setq js-indent-level 2)

(add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
(load-theme 'ujelly t)

(add-to-list 'load-path "~/.emacs.d/grizzl")
(require 'grizzl)

(add-to-list 'load-path "~/.emacs.d/evil")
(require 'evil)
(evil-mode 1)

(add-to-list 'load-path "~/.emacs.d/elpa/let-alist-1.0.4")
(require 'let-alist)

(add-to-list 'load-path "~/.emacs.d/elpa/dash-2.12.0")
(require 'dash)

(add-to-list 'load-path "~/.emacs.d/elpa/seq-2.16")
(require 'seq)

(add-to-list 'load-path "~/.emacs.d/exec-path-from-shell")
(require 'exec-path-from-shell)

(add-to-list 'load-path "~/.emacs.d/fiplr")
(require 'fiplr)

;; http://www.flycheck.org/manual/latest/index.html
(add-to-list 'load-path "~/.emacs.d/flycheck")
(require 'flycheck)

(add-to-list 'load-path "~/.emacs.d/go-mode.el")
(require 'go-mode-autoloads)

(add-to-list 'load-path "~/.emacs.d/powerline")
(require 'powerline)
(powerline-center-evil-theme)

(add-to-list 'load-path "~/.emacs.d/popup-el")
(require 'popup)

(add-to-list 'load-path "~/.emacs.d/auto-complete")
(require 'auto-complete)
(global-auto-complete-mode t)

(defvar *linum-mdown-line* nil)

(defun line-at-click ()
  (save-excursion
    (let ((click-y (cdr (cdr (mouse-position))))
          (line-move-visual-store line-move-visual))
      (setq line-move-visual t)
      (goto-char (window-start))
      (next-line (1- click-y))
      (setq line-move-visual line-move-visual-store)
      ;; If you are using tabbar substitute the next line with
      ;; (line-number-at-pos))))
      (1+ (line-number-at-pos)))))

(defun md-select-linum ()
  (interactive)
  (goto-line (line-at-click))
  (set-mark (point))
  (setq *linum-mdown-line*
        (line-number-at-pos)))

(defun mu-select-linum ()
  (interactive)
  (when *linum-mdown-line*
    (let (mu-line)
      ;; (goto-line (line-at-click))
      (setq mu-line (line-at-click))
      (goto-line (max *linum-mdown-line* mu-line))
      (set-mark (line-end-position))
      (goto-line (min *linum-mdown-line* mu-line))
      (setq *linum-mdown*
            nil))))

(global-set-key (kbd "<left-margin> <down-mouse-1>") 'md-select-linum)
(global-set-key (kbd "<left-margin> <mouse-1>") 'mu-select-linum)
(global-set-key (kbd "<left-margin> <drag-mouse-1>") 'mu-select-linum)

(global-linum-mode t)
(set-frame-font "Source Code Pro-13")

(add-to-list 'load-path "~/.emacs.d/elpa/wcheck-mode-2016.1.30")
(require 'wcheck-mode)

(defcustom ispell-program-name
  (or (locate-file "aspell"   exec-path exec-suffixes 'file-executable-p)
      (locate-file "ispell"   exec-path exec-suffixes 'file-executable-p)
      (locate-file "hunspell" exec-path exec-suffixes 'file-executable-p)
      "ispell")
  "Program invoked by \\[ispell-word] and \\[ispell-region] commands."
  :type 'string
  :group 'ispell)

(add-to-list 'load-path "~/.emacs.d/web-mode")
(require 'web-mode)

;; use web-mode for .jsx files
(add-to-list 'auto-mode-alist '("\\.jsx$" . web-mode))

(add-to-list 'load-path "~/.emacs.d/elpa/yasnippet-0.10.0")
(require 'yasnippet)
(yas-global-mode 1)
(yas-new-snippet)

;; turn on flychecking globally
(add-hook 'after-init-hook #'global-flycheck-mode)

;; disable jshint since we prefer eslint checking
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(javascript-jshint)))

;; use eslint with web-mode for jsx files
(flycheck-add-mode 'javascript-eslint 'web-mode)

;; customize flycheck temp file prefix
(setq-default flycheck-temp-prefix ".flycheck")

;; disable json-jsonlist checking for json files
(setq-default flycheck-disabled-checkers
              (append flycheck-disabled-checkers
                      '(json-jsonlist)))

;; https://github.com/purcell/exec-path-from-shell
;; only need exec-path-from-shell on OSX
;; this hopefully sets up path and other vars better
(when (memq window-system '(mac ns))
  (exec-path-from-shell-initialize))


;; adjust indents for web-mode to 2 spaces
(defun my-web-mode-hook ()
  "Hooks for Web mode. Adjust indents"
  ;;; http://web-mode.org/
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2))
(add-hook 'web-mode-hook  'my-web-mode-hook)


;; for better jsx syntax-highlighting in web-mode
;; - courtesy of Patrick @halbtuerke
(defadvice web-mode-highlight-part (around tweak-jsx activate)
           (if (equal web-mode-content-type "jsx")
             (let ((web-mode-enable-part-face nil))
               ad-do-it)
             ad-do-it))

(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("edf6d738a98dc8309d1c479390bfadfe3f7ef7542c8b0379e18eff11c5bf6bf3" default)))
 '(tool-bar-mode nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )


