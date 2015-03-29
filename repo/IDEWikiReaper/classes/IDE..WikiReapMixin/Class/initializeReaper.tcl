IDE::WikiReapMixin proc initializeReaper {} {
    if {![my exists initilaized]} {
    package require http
    IDE::Editor instmixin add IDE::WikiReapMixin
    }
    my set initialized 1
    IDE::Dialog infoMessage "All new created editors have additional menu item \"Wiki In\" that can be used to reap tcl source code from Wiki pages found under http://mini.net/tcl/\n More Info see http://mini.net/tcl/8179"
}
