(in-package :cl-user)
(defpackage trivial-exe
	(:use :cl)
	(:export
		:strip-extension
		:get-directory
		:executable-pathname
		:ensure-executable))
(in-package :trivial-exe)

(defun strip-extension (path-name)
	(make-pathname :host (pathname-host path-name)
						:device  (pathname-device path-name)
						:directory (pathname-directory path-name)
						:name (pathname-name path-name)))



(defun get-directory (path-name)
	(make-pathname :host (pathname-host path-name)
						:device  (pathname-device path-name)
						:directory (pathname-directory path-name)))


(defun executable-pathname ()
	"Return the absolute pathname to the running executable."
	#+sbcl
	sb-ext:*runtime-pathname*
	#+ccl
	(truename (make-pathname :host "ccl"))
	#+ecl
	(truename (make-pathname :host "sys"))
	#-(or sbcl ccl ecl)
	(if (probe-file #p"/proc/self/exe")
		;; Linux
		(uiop:resolve-absolute-location #p"/proc/self/exe")
		;; FreeBSD
		(uiop:resolve-absolute-location #p"/proc/curproc/file")))

(defun ensure-executable (pathname)
	"Ensure a binary is executable."
	#-(or win32 mswindows)
	(progn
		(setf (osicat:file-permissions pathname)
				(list :user-read
						:user-write
						:user-exec))
		t)
	#+(or win32 mswindows)
	t)
