;;ʹ��ibuffer�滻Ĭ�ϵ�C-x C-b
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

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
;;���Լ�¼��ʷ�ļ�
(add-to-list 'load-path (loe-expand-plugin-abs-path "session"))
(require 'session)
(add-hook 'after-init-hook 'session-initialize)



;;���kill-ring
;;(require 'browse-kill-ring)
;;(global-set-key [(control c)(k)] 'browse-kill-ring)
;;(browse-kill-ring-default-keybindings)
(add-to-list 'load-path (loe-expand-plugin-abs-path "browse-kill-ring"))
(add-to-list 'load-path (loe-expand-plugin-abs-path "browse-kill-ring-plus"))
(require 'browse-kill-ring+)

;;popup
;;need by auto-complete
(add-to-list 'load-path (loe-expand-plugin-abs-path "popup-el"))
(require 'popup)

;;auto-complete
(add-to-list 'load-path (loe-expand-plugin-abs-path "auto-complete"))
(require 'auto-complete-config)
(ac-config-default)

;;plantuml��emacs�����plantuml�ǻ�umlͼ�Ĺ���
(add-to-list 'load-path (loe-expand-plugin-abs-path "plantuml-mode"))
;;(defvar 'plantuml-jar-path "E:/git/emacs-plugins/plantuml-mode/plantuml.jar")
(require 'plantuml-mode)


