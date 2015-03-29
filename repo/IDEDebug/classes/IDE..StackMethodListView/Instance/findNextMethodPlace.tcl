IDE::StackMethodListView instproc findNextMethodPlace {method index} {
    set browser [my info parent]
    set hindex [expr {$index+1}]
    set invoke [lindex [$browser set invokeList] $hindex]
    if {$invoke ne "next"} return
    set obj [lindex [$browser set objectsList] $hindex]
    if {$obj eq ""} return
    foreach fobj [$obj info mixin] {
        set sig [$fobj procsearch $method]
        if {$sig ne ""} {return [lindex $sig 0]}
    }
    foreach hclass [[$obj info class] info heritage] {
        if {[$hclass info instprocs $method] ne ""} {return $hclass}
    }
    return
}
