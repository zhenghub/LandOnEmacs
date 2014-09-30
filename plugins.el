(defun loe-expand-plugin-abs-path (plugin-dir-name)
  "����`loe-plugin-dir'��չ·��"
  (concat loe-plugin-dir plugin-dir-name)
)

;;yasnippet
;;ģ�幤�ߣ�����ͨ������һ����д����չ�ɺ���ģ�壬�Ѿ�֧��C,C++,C#,Perl,Python,Ruby,SQL,LaTex,HTML,CSS�ȵ�.
(add-to-list 'load-path (loe-expand-plugin-abs-path "yasnippet"))
(require 'yasnippet)
(yas-global-mode 1)

;;ecb
;;emacs code browser�������ṩһ������window����ʾ��ǰ�ļ����µ��ļ�����ǰ�ļ��еĺ����������
(add-to-list 'load-path (loe-expand-plugin-abs-path "ecb"))
(setq loe-ecb-loaded nil)
(defun loe-load-ecb-if-not-loaded ()
  "���û�м���ecb���ͼ���"
  (if (not loe-ecb-loaded)
      (require 'ecb)
    (setq loe-ecb-loaded t)
    )
)

(defun loe-activate-ecb (&optional arg)
  "���û�м���ecb���ͼ���ecb��Ȼ������ecb"
  (interactive "P")
  (cond
   (arg (message arg))
   )
  (loe-load-ecb-if-not-loaded)
  (ecb-activate)
)
;;(require 'ecb-autoloads)

;;session.el
(add-to-list 'load-path (loe-expand-plugin-abs-path "session"))
(require 'session)
(add-hook 'after-init-hook 'session-initialize)


;;ipython
(setq python-shell-interpreter "python"
      python-shell-interpreter-args "-i D:\\program\\python27\\Scripts\\ipython2.exe"
      python-shell-prompt-regexp "In \\[[0-9]+\\]: .*"
      python-shell-prompt-output-regexp "Out\\[[0-9]+\\]: "
      python-shell-completion-setup-code "from IPython.core.completerlib import module_completion"
      python-shell-completion-module-string-code "';'.join(module_completion('''%s'''))\n"
      python-shell-completion-string-code "';'.join(get_ipython().Completer.all_completions('''%s'''))\n"
)
(message (concat "python-shell-prompt-regexp:" python-shell-prompt-regexp))
(message "\\")


;;���kill-ring
;;(require 'browse-kill-ring)
;;(global-set-key [(control c)(k)] 'browse-kill-ring)
;;(browse-kill-ring-default-keybindings)
(add-to-list 'load-path (loe-expand-plugin-abs-path "browse-kill-ring"))
(add-to-list 'load-path (loe-expand-plugin-abs-path "browse-kill-ring-plus"))
(require 'browse-kill-ring+)

;;popup
;;need by auto-complete
(add-to-list 'load-path "e:/git/emacs-plugins/popup-el")
(require 'popup)

;;auto-complete
(add-to-list 'load-path "e:/git/emacs-plugins/auto-complete")
(require 'auto-complete-config)
(ac-config-default)

