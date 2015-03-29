IDE::TestCase instproc assert {test {comment {}}} {
    set rtest [uplevel [list expr $test]]
    if {!$rtest} {
      error "assert failed ${comment}: [self callingproc] \"$test\" \"[uplevel [list subst $test]]\""
    }
}
