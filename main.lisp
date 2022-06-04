(ql:quickload "osicat")

(defclass file ()
  ((path    :accessor file-path
            :initarg :path
            :type string
            :documentation "The files path")
  (modified :accessor file-modified
            :initarg :modified
            :initform 0
            :type (integer 0)
            :documentation "The last time the file was modified"))
  (:documentation "The base class of files."))

;; (uiop:directory-files "./") Lists all files in current directory
;; (uiop:subdirectories  "./") Lists all subdirectories in current directory

(defun list-all-files (root-path)
  (map 'list #'(lambda (file-path)
        (make-instance  'file
                        :path file-path
                        :modified
                          (osicat-posix:stat-mtime (osicat-posix:stat file-path))))
    (uiop:directory-files root-path)))

(defun main ()
    (format t "Hello there"))
