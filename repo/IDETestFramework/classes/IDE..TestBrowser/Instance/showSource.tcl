IDE::TestBrowser instproc showSource {} {
    lassign [my getSelectedClassMethod] class method
    if {$class eq ""} return
    if {$method ne ""} {
        IDE::MethodBrowser newBrowserList "$class>$method" Test
    } else {
        IDE::HeritageBrowser newBrowser $class
    }

}
