IDE::StackMethodListView instproc selectItem item {
    if {$item eq ""} return
    set browser [my info parent]
    set index [my selectedIndex]
    set invoke [lindex [$browser set invokeList] $index]

    lassign [IDE::XOIntroProxy getDescFromDisplayItem $item] vclass vtype method
    if {$vtype eq "Procs"} {
         if {[info procs ::$method] ne ""} {
             if {$vclass eq ""} {
                 set vclass [IDE::TclProcsDescription getMethodFor $method]
                 if {$vclass ne ""} {
                     set vclass [$vclass getGroupObj]
                     my selectClassTypeMethod $vclass $vtype $method
                 } else {
                     set introProxy [IDE::XOIntroProxy getIntroProxy]
                     set body [$introProxy getProcBody $method]
                     [my info parent]::methodedit setTextControler $body [self]
                  }
             } else {
                 my selectClassTypeMethod $vclass $vtype $method
             }
         } else {
             set body "source code not accessible"
         }
    } else {
         my selectClassTypeMethod $vclass $vtype $method
    }

    ${browser}::methodedit colorizeText $invoke
}
