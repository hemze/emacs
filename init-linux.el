(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(Buffer-menu-use-frame-buffer-list nil)
 '(ansi-color-names-vector ["#242424" "#e5786d" "#95e454" "#cae682" "#8ac6f2" "#333366" "#ccaa8f" "#f6f3e8"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(comint-completion-addsuffix t)
 '(comint-completion-autolist t)
 '(comint-input-ignoredups t)
 '(comint-move-point-for-output t)
 '(comint-scroll-show-maximum-output t)
 '(comint-scroll-to-bottom-on-input t)
 '(comint-scroll-to-bottom-on-output t)
 '(custom-enabled-themes nil)
 '(fci-rule-color "#383838")
 '(fill-column 70)
 '(global-linum-mode nil)
 '(org-directory "~/.emacs.d/ORG/")
 '(org-support-shift-select t)
 '(show-paren-mode t)
 '(tool-bar-mode nil)
 '(vc-annotate-background "#2B2B2B")
 '(vc-annotate-color-map (quote ((20 . "#BC8383") (40 . "#CC9393") (60 . "#DFAF8F") (80 . "#D0BF8F") (100 . "#E0CF9F") (120 . "#F0DFAF") (140 . "#5F7F5F") (160 . "#7F9F7F") (180 . "#8FB28F") (200 . "#9FC59F") (220 . "#AFD8AF") (240 . "#BFEBBF") (260 . "#93E0E3") (280 . "#6CA0A3") (300 . "#7CB8BB") (320 . "#8CD0D3") (340 . "#94BFF3") (360 . "#DC8CC3"))))
 '(vc-annotate-very-old-color "#DC8CC3"))
(global-set-key (kbd "C-c t")
				'org-todo)
;(set-w32-system-coding-system 'cp1251)
;(setq w32-system-coding-system 'cp1251)

;; (add-to-list 'custom-theme-load-path "~/.emacs.d/themes/")
;; (load-theme 'zenburn t)

(add-hook 'dired-mode-hook
          (lambda ()
            (make-local-variable 'coding-system-for-read)
            (setq coding-system-for-read 'utf-8)
            (make-local-variable 'coding-system-for-write)
            (setq coding-system-for-write 'utf-8)))


;; new shell
;; (defun new-shell-buffer ()
;;   (interactive)
;;   (let ((new-shell-name
;;          (read-from-minibuffer "Shell name: " "" nil nil nil "shell" nil)))
;;     (unless (string= new-shell-name "")
;;       (shell new-shell-name))
;; ))

(global-set-key (kbd "C-z")
				'shell)

;; shortcut for window size changing
(global-set-key (kbd "C-{")
				'enlarge-window-horizontally)
(global-set-key (kbd "C-}")
				'shrink-window-horizontally)
(global-set-key (kbd "C-^")
				'enlarge-window)


(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )

;; !!!!!!!__PAY ATTENTION__!!!!!!!
;; **********************************
(add-to-list 'load-path "~/.emacs.d/rtf/")
(require 'rtf)
;; **********************************
(set-language-environment "UTF-8")

;; Makes clipboard work
(setq x-select-enable-clipboard t)
;; (setq interprogram-paste-function 'x-cut-buffer-or-selection-value)
(setq x-select-request-type '(UTF8_STRING COMPOUND_TEXT TEXT STRING))

;; для корректного выведения escape-последовательностей shell`a
(add-hook 'shell-mode-hook 'ansi-color-for-comint-mode-on)

;; Установки автоопределения кодировок. Первой будет определяться utf-8-unix
(prefer-coding-system 'cp866)
(prefer-coding-system 'koi8-r-unix)
(prefer-coding-system 'windows-1251-dos)
(prefer-coding-system 'utf-8-unix)

;; перед сохранением файлов
(add-hook 'before-save-hook '(lambda ()
                               ;; Удаляем оконечные пробелы
                               (delete-trailing-whitespace)))
;; Режим по умолчанию c переносом строк по ширине 130
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
(setq auto-fill-mode t)
(setq fill-column 130)

;; Создание резервных копий редактируемых файлов (Backup)
;; (info "(emacs)Auto Save")
(setq auto-save-interval 512)                ;; Количество нажатий до автосохранения
(setq auto-save-timeout 20)                  ;; Автосохранение в перерыве между нажатиями (в секундах)
(setq backup-directory-alist                 ;; Все временные копии в один каталог.
      '((".*" . "~/.emacs.d/backups")))      ;; Каталог создаётся автоматически.
(setq backup-by-copying t)                   ;; Режим сохранения копий
(setq version-control t)                     ;; Создавать копии с номерами версий
(setq delete-old-versions t)                 ;; Удалять старые версии без подтверждения
(setq kept-new-versions 6)                   ;; нумерованный бэкап - 2 первых и 2 последних
(setq kept-old-versions 2)


;; Оптимизация работы редактора
;; limit on number of Lisp variable bindings & unwind-protects
(setq max-specpdl-size (* 10 max-specpdl-size)) ; 10 * 1 M (default)
;; limit serving to catch infinite recursions for you before they
;; cause actual stack overflow in C, which would be fatal for Emacs
(setq max-lisp-eval-depth (* 10 max-lisp-eval-depth)) ; 10 * 400 (default)
;; speed up things by preventing garbage collections
(setq gc-cons-threshold (* 10 gc-cons-threshold)) ; 10 * 400 KB (default)


;; Интерфейс

;; Делаем емакс аскетичным
(menu-bar-mode nil)
;; (tool-bar-mode nil)
;; (scroll-bar-mode nil)
(setq column-number-mode t)                  ;; Показывать номер текущей колонки
(setq line-number-mode t)                    ;; Показывать номер текущей строки
;; (set-scroll-bar-mode 'right)                 ;; Полоса прокрутки справа
(setq inhibit-startup-message t)             ;; Не показываем сообщение при старте
(fset 'yes-or-no-p 'y-or-n-p)		         ;; не заставляйте меня печать "yes" целиком
(setq echo-keystrokes 0.001)                 ;; Мгновенное отображение набранных сочетаний клавиш
(setq use-dialog-boxes nil)                  ;; Не использовать диалоговые окна
(setq cursor-in-non-selected-windows nil)    ;; Не показывать курсоры в неактивных окнах
(setq default-tab-width 4)                   ;; размер табуляции
(setq-default indent-tabs-mode nil)          ;; отступ только пробелами
(setq initial-scratch-message nil)           ;; Scratch buffer settings. Очищаем его.
(setq case-fold-search t)                    ;; Поиск без учёта регистра
(global-font-lock-mode t)                    ;; Поддержка различных начертаний шрифтов в буфере
(setq font-lock-maximum-decoration t)        ;; Максимальное использование различных начертаний шрифтов
(if window-system (setq scalable-fonts-allowed t)) ;; Масштабируемые шрифты в графическом интерфейсе
(setq read-file-name-completion-ignore-case t) ;; Дополнение имён файлов без учёта регистра
(file-name-shadow-mode t)                    ;; Затенять игнорируемую часть имени файла
(setq resize-mini-windows t)                 ;; Изменять при необходимости размер минибуфера по вертикали
(auto-image-file-mode t)                     ;; Показывать картинки

(setq read-quoted-char-radix 10)             ;; Ввод символов по коду в десятичном счислении `C-q'
(put 'narrow-to-region 'disabled nil)        ;; Разрешить ограничение редактирования только в выделенном участке
(put 'narrow-to-page 'disabled nil)          ;; Разрешить ограничение редактирования только на текущей странице
(setq scroll-step 1)                         ;; Перематывать по одной строке
(setq temp-buffer-max-height                 ;; Максимальная высота временного буфера
      (lambda (buffer)
        (/ (- (frame-height) 2) 3)))
(temp-buffer-resize-mode t) ;; Высота временного буфера зависит от его содержимого
(setq frame-title-format '("" "%b @ Emacs " emacs-version)) ;; Заголовок окна

(setq scroll-conservatively 50)              ;; гладкий скроллинг с полями
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 1)

(setq-default cursor-type 'hbar)
;;(setq-default cursor-type 'hollow)
;;(setq-default cursor-type 'nil)
;;(setq-default cursor-type 'bar)

(setq scroll-conservatively 50)              ;; гладкий скроллинг с полями
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

(setq my-author-name (getenv "USER"))
(setq user-full-name (getenv "USER"))
(setq require-final-newline t)			     ;; always end a file with a newline

;; Красный не мигающий (!) курсор
(set-cursor-color "red")
(blink-cursor-mode nil)
;; мышка...
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag) ;; Scroll Bar gets dragged by mouse butn 1
(setq mouse-yank-at-point 't) 		    ;; Paste at point NOT at cursor


(show-paren-mode 1)                     ;; выделение парных скобок
;(setq show-paren-style 'expression)    ;; выделять все выражение в скобках
(add-hook 'lisp-mode-hook
		  '(lambda ()
			(local-set-key (kbd "RET") 'newline-and-indent)))

(global-set-key (kbd "\C-\\") 'user-toggle-input-method)
(global-set-key (kbd "\e(") 'user-to-cyr) ; Alt+Shift+9
(global-set-key (kbd "\e)") 'user-to-nil) ; Alt+Shift+0

(defun user-cyrillic-redefinitions ()
  "Set of global key binding for cyrillic.
;;(set-input-method "russian-computer")


(defun user-cyrillic-redefinitions ()
  "Set of global keys binding for cyrillic.
   This function is to be called from user-toggle-input-method"
  (global-set-key (kbd "?") (lambda()(interactive)(insert ",")))
  (global-set-key (kbd "/") (lambda()(interactive)(insert ".")))
  (global-set-key (kbd ",") (lambda()(interactive)(insert ":")))
  (global-set-key (kbd ":") (lambda()(interactive)(insert "%")))
  (global-set-key (kbd "*") (lambda()(interactive)(insert ";")))
  (global-set-key (kbd ";") (lambda()(interactive)(insert "*")))
  (global-set-key (kbd ".") (lambda()(interactive)(insert "?"))))

(defun user-nil-redefinitions ()
 "Restoring global keys binding after user-cyrillic-redefinitions.
  This function is to be called from user-toggle-input-method"
  (global-set-key (kbd "?") (lambda()(interactive)(self-insert-command 1)))
  (global-set-key (kbd "/") (lambda()(interactive)(self-insert-command 1)))
  (global-set-key (kbd "$") (lambda()(interactive)(self-insert-command 1)))
  (global-set-key (kbd ",") (lambda()(interactive)(self-insert-command 1)))
  (global-set-key (kbd ":") (lambda()(interactive)(self-insert-command 1)))
  (global-set-key (kbd "*") (lambda()(interactive)(self-insert-command 1)))
  (global-set-key (kbd ";") (lambda()(interactive)(self-insert-command 1)))
  (global-set-key (kbd ".") (lambda()(interactive)(self-insert-command 1))))

(defun user-toggle-input-method ()
  "Change the stadart function tuggle-input-method
   to redefine keys for cyrillic input from UNIX type to win type"
  (interactive)
  (toggle-input-method)
  (if (string= current-input-method "cyrillic-jcuken")
      (user-cyrillic-redefinitions)
    (user-nil-redefinitions))
  (message "keybord changed to %s" current-input-method))

(defun user-to-cyr ()
  "Change input method to Cyrillic,
   I bound this function with Alt-Shift-9, that is M-("
  (interactive)
  (when (string= current-input-method nil)
      (user-toggle-input-method)))

(defun user-to-nil ()
  "Change input method to nil (generally to English),
   I bound this function with Alt-Sfift-0 that is M-)"
  (interactive)
  (when (string= current-input-method "cyrillic-jcuken")
      (user-toggle-input-method)))

;; Итак, я предлагаю команду 'Meta-Meta-Shift-/' для того, чтобы запомнить текущую позицию
;; и команду 'Meta-Meta-/' для того, чтобы перейти на запомненную позицию, прежде запомнив текущую.
;;Toggle between saved positions as in MIM editor
(defun save-point-and-switch ()
  "Save current point to register 0 and go
to the previously saved position"
 (interactive)
 (let (temp)
   (setq temp (point-marker))
   (when (not (equal (get-register 0) nil))
     (jump-to-register 0))
   (set-register 0 temp)))

;;Save current position to register 0
(defun save-point-only ()
 "Save current point to register 0"
 (interactive)
 (set-register 0 (point-marker)))

(global-set-key (kbd "\e\e/") 'save-point-and-switch)
(global-set-key (kbd "\e\e?") 'save-point-only)

;; ******************************************************************
;; Comment-block function
(defun comment-or-uncomment-this (&optional lines)
  (interactive "P")
  (if mark-active
      (if (< (mark) (point))
          (comment-or-uncomment-region (mark) (point))
          (comment-or-uncomment-region (point) (mark)))
      (comment-or-uncomment-region
       (line-beginning-position)
       (line-end-position lines))))

(global-set-key (kbd "C-x /")
				'comment-or-uncomment-this)

;; Автоматическое выравнивание вставляемого из буфера обмена кода
(defadvice yank (after indent-region activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode c-mode c++-mode
                                objc-mode latex-mode plain-tex-mode python-mode))
      (indent-region (region-beginning) (region-end) nil)))
(defadvice yank-pop (after indent-region activate)
  (if (member major-mode
              '(emacs-lisp-mode scheme-mode lisp-mode c-mode c++-mode
                                objc-mode latex-mode plain-tex-mode python-mode))
      (indent-region (region-beginning) (region-end) nil)))

;; ******************************************************************
;; Поиск от kostafey C-f|C-r C-v
(global-unset-key "\C-f")
(global-set-key "\C-f" 'rgrep)
(global-set-key "\C-r" 'isearch-backward)
(add-hook 'isearch-mode-hook
		  '(lambda ()
;; Поиск от kostafey C-f|C-r C-v
(global-unset-key "\C-f")
(global-set-key "\C-f" 'isearch-forward)
(global-set-key "\C-r" 'isearch-backward)
(add-hook 'isearch-mode-hook
		  '(lambda ()
			 (define-key isearch-mode-map "\C-f"
			   'isearch-repeat-forward)
;; ******************************************************************
;; GOTOLINE
(global-set-key [?\M-g] 'goto-line)
;; ******************************************************************

;; ;; conkeror-browser
;; (eval-after-load "browse-url"
;;   '(defun browse-url-conkeror (url &optional new-window)
;;      "Ask the Conkeror WWW browser to load URL."
;;      (interactive (browse-url-interactive-arg "URL: "))
;;      ;; URL encode any `confusing' characters in the URL. This needs to
;;      ;; include at least commas; presumably also close parens and dollars.
;;      (while (string-match "[,)$]" url)
;;        (setq url (replace-match
;; 				  (format "%%%x" (string-to-char (match-string 0 url)))
;; 				  t t url)))
;;      (let* ((process-environment (browse-url-process-environment))
;; 			(process
;; 			 (apply 'start-process
;; 					(concat "conkeror " url)
;; 					nil "conkeror"
;; 					(list url)))))))
;; ;; set conkeror-browser
;; (setq browse-url-browser-function 'browse-url-conkeror)



;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; EXTENSIONS ;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; GOTOLINE
(global-set-key [?\M-g] 'goto-line)
(global-set-key (kbd "\e\eg") 'goto-line)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;; UTILITES ;;;;;;;;;;;;;;;;;;;;;;;;
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


;; Заменить окончания строк в формате DOS ^M на Unix
(defun dos-to-unix ()
  (interactive)
  (save-excursion
    (goto-char (point-min))
    (while (search-forward "\r" nil t)
      (replace-match ""))))
;; ******************************************************************

;; Удалить пробельные символы в конце строк
(defun delete-trailing-whitespaces ()
  (interactive "*")
  (delete-trailing-whitespace))

;; Поиск в Google по содержимому региона
(defun google-region (beg end)
  "Google the selected region."
  (interactive "r")
  (browse-url (concat "http://www.google.com/search?ie=utf-8&oe=utf-8&q="
                      (buffer-substring beg end))))
;; ******************************************************************
; OrgMode
(require 'org-install)
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;; Задание цепочек ключевых слов (переключение между словами клавишами Shift + Right или + Left с курсором на заголовке). "|" отмечает границу, если заголовок в статусе после этого разделителя, то он "выполнен", это влияет на планирование и отображение в Agenda Views:

(setq org-todo-keywords
      (quote ((sequence "TODO(t)" "STARTED(s)" "WROTE(w)" "PENDING(p@/)" "IN PROCESS(i)" "UNDEFINED(u)" "|" "DONE(d/!)" "CANCELLED(c@/)")
              (sequence "OPEN(o)" "|" "CLOSED(C)"))))

;; Поиск в Yandex по содержимому региона
(defun yandex-region (beg end)
  "Google the selected region."
  (interactive "r")
  (browse-url (concat "http://yandex.ru/yandsearch?text="
                      (buffer-substring beg end))))


; OrgMode
(require 'org-install)
;; Включение автоматического переключения в Org Mode при открытии файла с расширением .org:
(add-to-list 'auto-mode-alist '("\\.org\\'" . org-mode))
(add-hook 'org-mode-hook 'turn-on-font-lock) ; not needed when global-font-lock-mode is on
;; Задание цепочек ключевых слов (переключение между словами клавишами Shift + Right или + Left с курсором на заголовке). "|" отмечает границу, если заголовок в статусе после этого разделителя, то он "выполнен", это влияет на планирование и отображение в Agenda Views:
(setq org-todo-keywords '((sequence "TODO(t)" "START(s)" "MEET(m)" "CALL(c)" "DELEGATED(d)" "WAIT(w)" "|" "CANCEL(r)"  "DONE(f)")))

(global-set-key "\C-cl" 'org-store-link)
(global-set-key "\C-ca" 'org-agenda)
(global-set-key "\C-cb" 'org-iswitchb)
;; Задание произвольного начертания ключевым словам:
(setq org-todo-keyword-faces

      '(("UNDEFINED" . (:foreground "red3" :weight bold))
        ("TODO" . (:foreground "red3" :weight bold))
        ("STARTED" . (:foreground "MediumBlue" :weight bold))
        ("PENDING" . (:foreground "DimGray" :weight bold))
        ("WROTE" . (:foreground "DimGray" :weight bold))
        ("IN PROCESS" . (:foreground "MediumBlue" :weight bold))
        ("CANCEL" . (:foreground "grey" :weight bold))
        ("DONE" . (:foreground "forestgreen" :weight bold)))
      )

(setq org-agenda-files (quote ("~/.emacs.d/ORG/all.org" "~/.emacs.d/ORG/actslist.org" "~/.emacs.d/ORG/projects.org" "~/.emacs.d/ORG/diary.org" "~/.emacs.d/ORG/regular.org" "~/.emacs.d/ORG/domesticity.org")))
;; **********************************
(setq org-agenda-restore-windows-after-quit t)
;;logging stuff
(setq org-log-repeat nil)
(setq org-log-into-drawer nil)
(setq org-log-done nil)
(setq org-log-redeadline nil)
(setq org-log-reschedule nil)

;; Настройка

(setq org-startup-indented t)

;; ******************************************************************
(setq file-name-coding-system 'utf-8)

(global-set-key [?\C-x ?\C-g] 'goto-line)
(global-set-key [?\C-x ?\C-b] 'ibuffer)















(custom-set-variables
  ;; custom-set-variables was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(custom-set-faces
  ;; custom-set-faces was added by Custom.
  ;; If you edit it by hand, you could mess it up, so be careful.
  ;; Your init file should contain only one such instance.
  ;; If there is more than one, they won't work right.
 )
(setq file-name-coding-system 'utf-8-emacs)

(global-set-key [?\C-z] 'shell)
(global-set-key [?\C-x ?\C-g] 'goto-line)
(global-set-key [?\C-x ?\C-b] 'ibuffer)


;;
;;server control keybinding
>>>>>>> 940c52a8e0c8e75c1c994aee2f467339d8a66ece
;;
(defun start-slime ()
  (interactive)
  (slime))
(global-set-key [?\C-x ?\M-s] 'start-slime)

(defun kill-slime ()
  (interactive)
  (slime-quit-lisp)
  (kill-buffer "*slime-repl sbcl*"))

(global-set-key [?\C-x ?\M-d] 'kill-slime)

(defun restart-slime (&optional restart)
  (interactive)
  (progn
    (slime-restart-inferior-lisp)))
(global-set-key [?\C-x ?\M-r] 'restart-slime)

<<<<<<< HEAD
;; ******************************************************************
;; Beautify
(set-face-font 'default "Courier New: Regular:12:: Cyrillic")
(blink-cursor-mode 0)
(global-hl-line-mode 1)
=======

(global-font-lock-mode t) ;; Поддержка различных начертаний шрифтов в буфере
>>>>>>> 940c52a8e0c8e75c1c994aee2f467339d8a66ece
(setq font-lock-maximum-decoration t) ;; Максимальное использование различных начертаний шрифтов
(if window-system (setq scalable-fonts-allowed t)) ;; Масштабируемые шрифты в графическом интерфейсе
(setq read-file-name-completion-ignore-case t) ;; Дополнение имён файлов без учёта регистра
(file-name-shadow-mode t) ;; Затенять игнорируемую часть имени файла
(setq resize-mini-windows t) ;; Изменять при необходимости размер минибуфера по вертикали
(auto-image-file-mode t) ;; Показывать картинки
(setq read-quoted-char-radix 10) ;; Ввод символов по коду в десятичном счислении `C-q'
(put 'narrow-to-region 'disabled nil) ;; Разрешить ограничение редактирования только в выделенном участке
(put 'narrow-to-page 'disabled nil) ;; Разрешить ограничение редактирования только на текущей странице
(setq scroll-step 1) ;; Перематывать по одной строке
(setq temp-buffer-max-height ;; Максимальная высота временного буфера
      (lambda (buffer)
        (/ (- (frame-height) 2) 3)))
(temp-buffer-resize-mode t) ;; Высота временного буфера зависит от его содержимого
(setq frame-title-format '("" "%b @ Emacs " emacs-version)) ;; Заголовок окна

<<<<<<< HEAD
=======
(setq scroll-conservatively 50) ;; гладкий скроллинг с полями
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 10)

>>>>>>> 940c52a8e0c8e75c1c994aee2f467339d8a66ece
(setq my-author-name (getenv "USER"))
(setq user-full-name (getenv "USER"))
(setq require-final-newline t);; always end a file with a newline

<<<<<<< HEAD
;; ******************************************************************
;; Move between windows (for org-mode):
(global-set-key (kbd "C-M-<left>")  'windmove-left)
(global-set-key (kbd "C-M-<right>") 'windmove-right)
(global-set-key (kbd "C-M-<up>")    'windmove-up)
(global-set-key (kbd "C-M-<down>")  'windmove-down)
;; ******************************************************************

(windmove-default-keybindings 'meta)
(desktop-save-mode t)

(tool-bar-mode 0)
(menu-bar-mode 1)
(setq case-fold-search t)
(setq read-file-name-completion-ignore-case t)


;; ******************************************************************
;; eww
(setq load-path
      (append (list nil "~/.emacs.d/eww")
      load-path))
(require 'eww)
=======
;; Красный не мигающий (!) курсор
(set-cursor-color "red")
(blink-cursor-mode nil)
;; мышка...
(global-set-key [vertical-scroll-bar down-mouse-1] 'scroll-bar-drag) ;; Scroll Bar gets dragged by mouse butn 1
(setq mouse-yank-at-point 't) ;; Paste at point NOT at cursor



(setq scroll-conservatively 50)
(setq scroll-preserve-screen-position 't)
(setq scroll-margin 5)
(setq scroll-step 1)
(windmove-default-keybindings 'meta)
(desktop-save-mode t)

(add-hook 'lisp-mode-hook
	    '(lambda ()
	      (local-set-key (kbd "RET") 'newline-and-indent)))

(setq load-path
      (append (list nil "~/.emacs.d")
      load-path))


(setq load-path
      (append (list nil "~/.emacs.d/php")
      load-path))

(setq load-path
      (append (list nil "~/.emacs.d/psgml")
      load-path))

(delete-selection-mode 1)
(transient-mark-mode 1)

;; ******************************************************************
;; IBuffer settings
(setq ibuffer-saved-filter-groups
      (quote (("default"
               ("SYS" (or
                       (mode . dired-mode)
                       (name . "^\\*scratch\\*$")
                       (name . "^\\*Messages\\*$")))
               ;; ("REPL" (or
               ;;          (name . "^\\*inferior-lisp.*")
               ;;          (name . "^\\*slime-events.*")
               ;;          (name . "^\\*slime-repl.*")
               ;;          (name . "^\\*Python.*")
               ;;          (name . "*\\*sldb.*")))
               ("SHELL" (or
                         (mode . shell-mode)
                         (name . "^\\*Shell\\*$")
                         (name . "^\\*grep\\*$")))
               ;; ("C/CPP" (or
               ;;           (mode . c-mode)
               ;;           (mode . c++-mode)))
               ("ORG" (or
                       (mode . org-mode)))
               ("LISP" (or
                        (mode . lisp-mode)))
               ("HTML" (or
                        (mode . html-mode)
                        (mode . closure-template-html-mode)))
               ("JS" (or
                      (name . "^\\*.js")
                      (mode . espresso-mode)
                      (mode . javascript-mode)))
               ("CSS" (or
                       (mode . css-mode)))
               ("ELISP" (or
                         (mode . elisp-mode)
                         (mode . emacs-lisp-mode)))
               ("SQL" (or
                         (mode . sql-mode)
                         (name . "^\\*.sql"))))

(autoload 'php-mode "php-mode" "Major mode for editing php code." t)
(add-to-list 'auto-mode-alist '("\\.php$" . php-mode))

(load "sgml-mode")
(add-to-list 'auto-mode-alist '("\\.html$" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.phtml$" . sgml-mode))
(add-to-list 'auto-mode-alist '("\\.xml$" . sgml-mode))
;;sgml vars
(setq sgml-balanced-tag-edit t)
(setq sgml-auto-insert-required-elements t)
(setq sgml-insert-defaulted-attributes t)
(setq sgml-tag-region-if-active t)
(setq sgml-insert-element t)
(setq sgml-set-face t)
(setq sgml-live-element-indicator t)

(tool-bar-mode 0)
(menu-bar-mode 0)
(setq case-fold-search t)
(setq read-file-name-completion-ignore-case t)
(show-paren-mode t)
(put 'upcase-region 'disabled nil)

(add-hook 'ibuffer-mode-hook
          (lambda ()
            (ibuffer-switch-to-saved-filter-groups
             "default")))
(setq ibuffer-formats
      (quote ((mark modified read-only " "
                    (name 32 32 :left :elide) " "
                    (size 9 -1 :right) " "
                    (mode 16 16 :left :elide) " " filename-and-process)
              (mark " " (name 16 -1) " " filename))))
;; ******************************************************************
(when (load (expand-file-name "~/.emacs.d/elpa/package.el")) (package-initialize))

;; ******************************************************************
;; FB2 viewing
;Авто определение формата по расширению файла
(add-to-list 'auto-mode-alist '(".fb2$" . fb2-mode-view))
;Функция для файлов .fb2 в режиме просмотра
(defun fb2-mode-view()
  (vc-toggle-read-only)
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0))
;Функция для файлов .fb2 в режиме редактирования
(defun fb2-mode-edit()
  (vc-toggle-read-only nil)
  (interactive)
  (sgml-mode)
  (sgml-tags-invisible 0))
(put 'scroll-left 'disabled nil)

;; ******************************************************************
;; !!!!!!!__PAY ATTENTION__!!!!!!!
;; **********************************
;; (setq url-proxy-services
;;       '(("no_proxy" . "^\\(localhost\\|10.*\\)")
;;         ("http" . "srv-proxy2.net.billing.ru:3128")
;;         ("https" . "srv-proxy2.net.billing.ru:3128")))
;; (setq url-http-proxy-basic-auth-storage
;;       (list (list "srv-proxy2.net.billing.ru:3128"
;;                   (cons "Input your LDAP UID !"
;;                         (base64-encode-string "seymour.makarov:listentothemusic")))))
;; **********************************

;; org-mobile settings
(setq org-directory "~/.emacs.d/ORG/")
(setq org-mobile-directory "C:/Users/Seymour.Makarov/Dropbox/Apps/MobileOrg/")
(setq org-mobile-files (list "common-tasks.org" "tasks-planned.org"))
(setq org-mobile-inbox-for-pull "~/.emacs.d/ORG/flagged.org")

;; Режим по умолчанию c переносом строк по ширине 130
;(defun change-width()
;  (interactive)
;  (let ((width
;         (read-from-minibuffer "Set column width: " "" nil nil nil "500" nil)))
;    (unless (string= width "")
;      (setq fill-column (car (read-from-string width))))))
(setq default-major-mode 'text-mode)
(add-hook 'text-mode-hook 'turn-on-auto-fill)
;(add-hook 'text-mode-hook 'toggle-word-wrap)
(setq auto-fill-mode t)
(setq fill-column 0)
; (global-set-key (kbd "C-{")
;; 				'enlarge-window-horizontally)


;; Bookmarks
(setq inhibit-splash-screen t)
(require 'bookmark)
(bookmark-bmenu-list)
(switch-to-buffer "*Bookmark List*")
(global-set-key [f6] 'bookmark-set)
(global-set-key [f7] 'bookmark-jump)
(setq bookmark-default-file  (concat user-emacs-directory "bookmarks"))

;; Multiple cursors
(setq load-path
      (append (list nil "~/.emacs.d/multiple-cursors/")
              load-path))
(require 'multiple-cursors)
(global-set-key (kbd "C-c >") 'mc/mark-next-like-this)
(global-set-key (kbd "C-c <") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-c <") 'mc/mark-all-like-this)
(global-set-key (kbd "C-c C-c >") 'mc/edit-lines)

(defvar jc/mc-search--last-term nil)

(defun jc/mc-search (search-command)
  ;; Read new search term when not repeated command or applying to fake cursors
  (when (and (not mc--executing-command-for-fake-cursor)
             (not (eq last-command 'jc/mc-search-forward))
             (not (eq last-command 'jc/mc-search-backward)))
    (setq jc/mc-search--last-term (read-from-minibuffer "Search: ")))
  (funcall search-command jc/mc-search--last-term))

(defun jc/mc-search-forward ()
  "Simplified version of forward search that supports multiple cursors"
  (interactive)
  (jc/mc-search 'search-forward))

(defun jc/mc-search-backward ()
  "Simplified version of backward search that supports multiple cursors"
  (interactive)
  (jc/mc-search 'search-backward))

(define-key mc/keymap (kbd "C-c s") 'jc/mc-search-forward)
(define-key mc/keymap (kbd "C-c r") 'jc/mc-search-backward)

;; Revert Buffer
(defun revert-buffer-no-confirm ()
  "Revert buffer without confirmation."
  (interactive) (revert-buffer t t))
(global-set-key [f5] 'revert-buffer-no-confirm)
(put 'upcase-region 'disabled nil)
