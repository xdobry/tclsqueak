TclHtmlBuilder instproc getRootReference linkName {
    my instvar rootBackReference
    file join $rootBackReference $linkName
}
