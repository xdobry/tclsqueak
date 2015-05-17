IDE::PersistentUIStateSupport proc restoreUIFrom uistates {
    foreach s $uistates {
        if {[catch {
            if {[dict exists $s create]} {
                set createExpr [dict get $s create]
                lassign $createExpr class method
                if {$method eq "newBrowser" && [Object isclass $class] && [llength [$class info superclass -closure IDE::PersistentUIStateSupport]]>0} {
                    set inst [$class $method]
                    $inst setUIState $s
                }
            }
        } ret]} {
            puts "error by restoring uistate $ret"
        }
    }
}
