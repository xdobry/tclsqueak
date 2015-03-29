IDE::TestRunner instproc runTestCases {testCasesList notifier} {
    foreach case $testCasesList {
        my runTestCase $case $notifier
    }
}
