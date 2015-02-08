(message "starting loading landOnEmacs")

;;org-mode
(setq org-startup-indented t);;��org-modeʱ�Զ�����org-indent-mode
(global-set-key "\C-cl" 'org-store-link);;ʹ��org-modeʱ�ڵ�ǰλ�ñ������ӣ������Ϳ���ʹ��C-c C-lʱʹ�ñ��������
(setq org-todo-keywords '((sequence "TODO(t)" "STARTED(s!)" "HUANGUP(h)" "INTERRUPT(i!)" "|" "DONE(d!)" "CANCELD(c)" "FAIL(f!@)")))

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

(defun loe-not-empty-p (sequence)
  "�ж�sequence�Ƿ�Ϊ��"
  (< 0 (length sequence))
  )

(defun loe-ensure-list (obj)
  "���obj����list����ת��list"
  (if (listp obj)
      obj
    (list obj)
    )
  )

(defun loe-append-element (sequence ele)
  "��ele��ӵ�sequence�����"
  (if sequence
      (nconc sequence (loe-ensure-list ele))
    (list ele)
    )
  )

(defun loe-list-subdirs (path &optional recursive)
  "��ȡpath-list�µ��������ļ��У����recursiveΪnon-nil�����ǵݹ鰴����������ȱ�����˳��ݹ�������ļ���"
  (if (file-directory-p path)
      (if (not recursive)
	  (let ((dir-list (list)))
	    (dolist (subdir (directory-files path t) dir-list)
	      (and (file-directory-p subdir);;�ж��Ƿ��ļ���
		   (not (member (file-name-nondirectory subdir) '("." "..")))
		   (setq dir-list (loe-append-element dir-list subdir)))))
	(progn
	  (let ((stack (loe-list-subdirs path)) result-list curpath)
		(while (loe-not-empty-p stack)
		  (setq curpath (pop stack))
		  (setq result-list (loe-append-element result-list curpath))
		  (setq stack (nconc (loe-list-subdirs curpath) stack))
		  )
		result-list
		)
	    ))))

(defun loe-nconc-childlist (list)
  (let (result)
    (dolist (child list result)
      (setq result (nconc result (loe-ensure-list child)))
      )
    )
  )
      
(defun loe-include-subdirs (dir-list &optional recursive)
  "��dir-list��ÿ���ļ��е���Ŀ¼Ҳ������������recursiveΪnon-nil����ݹ�������ļ���"
  (loe-nconc-childlist (mapcar (lambda (dir) (cons dir (loe-list-subdirs dir recursive)))
	  dir-list
	  )))

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

;;�Զ�������Ե�����
(show-paren-mode)



