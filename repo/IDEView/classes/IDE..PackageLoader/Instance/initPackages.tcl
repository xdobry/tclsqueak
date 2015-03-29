IDE::PackageLoader instproc initPackages {} {
    # init internal package list
    catch {package require dummy}
    set packages [list]
    foreach p [package names] {
        if {[catch [list package present $p]]} {
            lappend packages $p
        }
    }
    my @packages setList $packages
    my unselectState
}
