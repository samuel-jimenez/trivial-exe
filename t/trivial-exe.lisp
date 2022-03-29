(in-package :cl-user)
(defpackage trivial-exe-test
	(:use :cl :fiveam)
	(:export :run-tests))
(in-package :trivial-exe-test)

(def-suite tests
	:description "trivial-exe tests.")
(in-suite tests)


(test strip-extension
	(is-true
		(equal #P"C:/foo/path/name" (merge-pathnames "path/name" (trivial-exe:strip-extension #P"C:/foo/bar.exe"))))
	(is-true
		(equal #P"C:/foo/path/name/bar" (merge-pathnames "path/name/" (trivial-exe:strip-extension #P"C:/foo/bar.exe"))))
	(is-true
		(equal #P"/foo/path/name" (merge-pathnames "path/name" (trivial-exe:strip-extension #P"/foo/bar.exe"))))
	(is-true
		(equal #P"/foo/path/name/bar" (merge-pathnames "path/name/" (trivial-exe:strip-extension #P"/foo/bar.exe")))))


(test get-directory
	(is-true
		(equal #P"C:/foo/path/name" (merge-pathnames "path/name" (trivial-exe:get-directory #P"C:/foo/bar.exe"))))
	(is-true
		(equal #P"C:/foo/path/name/" (merge-pathnames "path/name/" (trivial-exe:get-directory #P"C:/foo/bar.exe"))))
	(is-true
		(equal #P"/foo/path/name" (merge-pathnames "path/name" (trivial-exe:get-directory #P"/foo/bar"))))
	(is-true
		(equal #P"/foo/path/name/" (merge-pathnames "path/name/" (trivial-exe:get-directory #P"/foo/bar")))))


(test simple-test
	(is-true
		(pathnamep (trivial-exe:executable-pathname)))
	(finishes
		(trivial-exe:ensure-executable
			(asdf:system-relative-pathname :trivial-exe #p"README.md"))))


(defun run-tests ()
	(run! 'tests))
