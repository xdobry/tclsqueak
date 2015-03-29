IDE::TestRunner instproc getTestsForCase testClass {
    lsort [$testClass info instprocs test*]
}
