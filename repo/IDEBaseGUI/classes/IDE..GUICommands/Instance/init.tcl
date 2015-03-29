IDE::GUICommands instproc init args {
    my instvar win atHead
    set ms [my getMenuStruct]
    if {$ms ne ""} { [self] fillMenuStruct $ms }
    if {$ms ne "" && ![$ms isEmpty]} {
        if {[winfo toplevel $win] eq "."} {
            set mainmenu .mb
        } else {
            set mainmenu [winfo toplevel $win].mb
        }
        set menuwin $mainmenu.[Object autoname menu]
        $ms createTkMenu $menuwin [winfo toplevel $win]
        if {![$ms popdownMenuOnly]} {
            if {$atHead} {
                if {[$ms set underline] ne ""} {
                    $mainmenu insert 0 cascade -label [$ms set name] -menu $menuwin -underline [$ms set underline]
                } else {
                    $mainmenu insert 0 cascade -label [$ms set name] -menu $menuwin
                }
            } else {
                if {[$ms set underline] ne ""} {
                    $mainmenu add cascade -label [$ms set name] -menu $menuwin -underline [$ms set underline]
                } else {
                    $mainmenu add cascade -label [$ms set name] -menu $menuwin
                }
            }
        }
        # The menu struct is needed to compute enablement
        # $ms destroy
        set pwin [my popMenuWindow]
        if {$pwin ne "" && [$ms hasPopdownMenu]} {
            $ms buildPopDownMenu $win.popdown [winfo toplevel $win]
            bind $pwin <ButtonPress-3> [list $ms showPopMenu $win.popdown %X %Y]
        }
    }
    next
}
