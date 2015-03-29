IDE::TclModeEdit instproc enterVar tag {
    my instvar varTagArr varArr
    if {[catch {set varName $varTagArr($tag)}]} {
        puts "can not find $tag"
        return
    }
    [my info parent] setStatusBarText $varArr($varName)
}
