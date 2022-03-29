# trivial-exe

[![CircleCI](https://circleci.com/gh/samuel-jimenez/trivial-exe/tree/master.svg?style=svg)](https://circleci.com/gh/samuel-jimenez/trivial-exe/tree/master)
[![Coverage Status](https://coveralls.io/repos/github/samuel-jimenez/trivial-exe/badge.svg?branch=master)](https://coveralls.io/github/samuel-jimenez/trivial-exe?branch=master)

Tools for working with executables

# Usage

```lisp
CL-USER> (ql:quickload :trivial-exe)

CL-USER> (trivial-exe:executable-pathname)
#P"/usr/local/bin/sbcl"

CL-USER> (trivial-exe:ensure-executable #p"/path/to/binary")
T
```

# License

Copyright (c) 2015 Fernando Borretti

Licensed under the MIT License.
