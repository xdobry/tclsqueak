IDE::TestBrowser instproc fillMenuStruct ms {
    $ms addCommand {Run All Tests} [list [self] runWithIn runAllTests]
    $ms addCommand {Refresh} [list [self] runWithIn refreshTests]
}
