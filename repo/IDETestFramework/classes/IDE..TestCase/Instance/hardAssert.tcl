IDE::TestCase instproc hardAssert test {
    # This Asset can stop testing
    set rtest [uplevel [list expr $test]]
    if {!$rtest} {
      my stopTesting
      error "assert failed: [self callingproc] \"$test\""
    }
}
