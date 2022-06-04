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

;; Stupid thing that doesn't do what it might look like when seeing the name
(defun list-all-files-prime ()
  (map 'list #'(lambda (file) (osicat-posix:stat-mtime (osicat-posix:stat file)))
    (uiop:directory-files "./")))

(defun list-all-files ()
  ())


(defun main ()
    (format t "Hello there"))
