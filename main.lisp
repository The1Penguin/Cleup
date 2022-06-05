(ql:quickload "osicat")

(deftype file-state () '(new deleted existing))
(deftype file-modified () '(updated not-updated))

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

;; TODO add the ability to hide . files.
;; TODO change behaviour to be relative rather than absolute concerning paths.
(defun list-all-files (root-path)
  (apply #'concatenate 'list
               (map 'list #'(lambda (file-path)
                              (make-instance  'file
                                              :path file-path
                                              :modified
                                              (osicat-posix:stat-mtime
                                               (osicat-posix:stat file-path))))
                    (uiop:directory-files root-path))
               (remove-if
                #'(lambda (x) (equal x NIL))
                (concatenate 'list
                             (map 'list #'list-all-files
                                  (uiop:subdirectories root-path))))))

(defun main ()
  (format t "Hello there"))
