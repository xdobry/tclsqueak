IDE::MethodEdit instproc save {} {
    if {![my exists oldtext]} return
    set newtext [my getText]
    if {[[my getTextWindow] edit modified]} {
       my saveValue $newtext
    }
}
