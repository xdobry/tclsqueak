IDE::GUICommands instproc upsMessage text {
    set p [my info parent]
    if {[Object isobject $p] && [$p istype IDE::Browser]} {
        $p setStatusBarText $text
    }
}
