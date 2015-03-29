IDE::ClassView instproc changeHeritageView {} {
    if {[my exists vcomponent]} {
        my selectFor [my set vcomponent]
    }
}
