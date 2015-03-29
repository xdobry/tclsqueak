IDE::TObjectBrowser instproc testBTestObject {} {
    if {![Object isclass TOBExample] ||
         ![Object isobject tobExample]} {
        my stopTesting
        error "Test Object not exists"
    }
}
