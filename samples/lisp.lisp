(defpackage :nebula-sample
  (:use :cl))

(in-package :nebula-sample)

(defparameter *palette*
  '((:keyword . "#C43030")
    (:string . "#E8D080")
    (:comment . "#4A3A6A")
    (:function . "#8AB4E8")))

(defparameter *groups*
  '((:warm :keyword :number :constant)
    (:cool :function :type :operator)
    (:muted :comment :doc)))

(defun enabled-colors (&optional (palette *palette*))
  (loop for (token . hex) in palette
        when (and hex (> (length hex) 0))
          collect (list token :hex hex :enabled t)))

(defun color-family (token)
  (loop for (family . items) in *groups*
        when (member token items)
          do (return family)
        finally (return :other)))

(defun render-report (&key (stream *standard-output*))
  (dolist (entry (enabled-colors))
    (destructuring-bind (token &key hex enabled) entry
      (format stream "~&~A ~A ~A~%"
              token
              (color-family token)
              (if enabled hex "disabled")))))

(defmacro with-theme ((name) &body body)
  `(let ((theme-name ,name))
     (format t "~&Theme: ~A~%" theme-name)
     ,@body))

(with-theme ("Nebula Drift: Rosette")
  (render-report)
  (format t "~&Count: ~D~%" (length (enabled-colors))))

(labels ((severity-for (token)
           (case token
             (:keyword :high)
             (:function :medium)
             (:comment :low)
             (otherwise :normal))))
  (dolist (pair *palette*)
    (destructuring-bind (token . hex) pair
      (format t "~&~A ~A ~A~%" token (severity-for token) hex))))

(loop for idx from 0
      for (token . hex) in *palette*
      do (format t "~&~D => ~A ~A~%" idx token hex))
