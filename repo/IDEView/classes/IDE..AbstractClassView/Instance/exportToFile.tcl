IDE::AbstractClassView instproc exportToFile actual {
    global tcl_platform
    my instvar vclass
    if {$tcl_platform(platform) eq "windows"} {
        regsub -all :: $actual _ name
    } else {
        set name $actual
    }
    set file [IDE::Dialog getSaveFile $name.xotcl]
    if {$file eq ""} return
    set fh [open $file w]
    if {[Object isobject $vclass] && [$vclass istype IDE::ProcsGroup]} {
        set body [$vclass getBody]
    } else {
        set introProxy [my getIntroProxy]
        set body [$introProxy getObjectBody $actual]
    }
    puts -nonewline $fh $body
    close $fh
}
