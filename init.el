(message "starting loading landOnEmacs")

;;org-mode
(setq org-startup-indented t);;��org-modeʱ�Զ�����org-indent-mode
(global-set-key "\C-cl" 'org-store-link);;ʹ��org-modeʱ�ڵ�ǰλ�ñ������ӣ������Ϳ���ʹ��C-c C-lʱʹ�ñ��������

;;common
(global-linum-mode t);;��ʾ�к���
(display-time-mode 1);;��minibuffer����ʾʱ��
(setq display-time-24hr-format t);;ʹ��24Сʱ��
(setq display-time-day-and-date t);;��ʾ����
(setq display-time-interval 10);;ʱ��ˢ��Ƶ��

(defun loe-expand-relative-path (relative-path)
  "�����·����չ�ɾ���·��"
  (setq abs-path (file-name-directory load-file-name))
  (concat abs-path relative-path)
)

(defun loe-goto-line-or-recenter (&optional arg)
  "����в���������arg��ָ�����У�����ֻ�ǵ�������ҳ�棬�ù����С��Ӷ����ӵ�"
  (interactive "P")
  (cond
   (arg (goto-line arg));;����ָ����
   (t (recenter-top-bottom))
   )
)
(global-set-key "\C-l" 'loe-goto-line-or-recenter)


(defun loe-refresh-file ()
  "ˢ���ļ������buffer�����޸ģ���ѯ���û��Ƿ�ȷ��������ֱ��ˢ��"
  (interactive)
  (revert-buffer t (not (buffer-modified-p)) t)
)
(global-set-key [(control f5)] 'loe-refresh-file)


;;ʹ��ibuffer�滻Ĭ�ϵ�C-x C-b
(require 'ibuffer)
(global-set-key (kbd "C-x C-b") 'ibuffer)

(load (loe-expand-relative-path "plugins.el"));;���ز�������ļ�
(load (loe-expand-relative-path "thems.el"));;�������������ļ�
