(import (scheme base)
	(cyclone test)
	(cyclone irregex))

(define (run-tests)
  (test-begin)

  (test-assert (irregex-search "\\x41," "A,"))
  (test-assert (irregex-search "\\x{0041}" "A,"))

  (test-assert (irregex-search "<[[:alpha:]]+>" "<abc>"))
  (test-assert (not (irregex-search "<[[:alpha:]]+>" "<ab7c>")))
  (test-assert (irregex-search "<[[^:alpha:]]+>" "<123>"))
  (test-assert (not (irregex-search "<[[^:alpha:]]+>" "<12a3>")))
  (test-error (irregex-search "<[[=alpha=]]+>" "<abc>"))
  (test-error (irregex-search "<[[.alpha.]]+>" "<abc>"))

  (test-assert (irregex-match "\\Q.*\\+" ".*\\+"))
  (test-assert (irregex-match "\\Q.*\\+\\E" ".*\\+"))
  (test-assert (not (irregex-match "\\Q.*\\+\\E" "x*\\+")))
  (test-assert (irregex-match "\\Q.*\\" ".*\\"))

  (test-end))

(run-tests)

