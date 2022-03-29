(defsystem trivial-exe-test
	:author "Fernando Borretti <eudoxiahp@gmail.com>"
	:license "MIT"
	:depends-on (
						:trivial-exe
						:fiveam)
	:perform (test-op (o s) (uiop:symbol-call '#:trivial-exe-test '#:run-tests))
	:components ((
						:module "t"
						:serial t
						:components
						((:file "trivial-exe")))))
