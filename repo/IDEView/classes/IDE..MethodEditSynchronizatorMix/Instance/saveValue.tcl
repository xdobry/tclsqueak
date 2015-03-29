IDE::MethodEditSynchronizatorMix instproc saveValue value {
    next
    my instvar vclass vctype method editMode
    # problems
    # 1 new methods
    # 2 methods with inside changed bodies
    if {![info exists vclass]} {
        return
    }
    # value is not real list
    if {[catch {lindex $value 0}]} {
        return
    }
    set instance [self]
    set key "$vclass $vctype $method"
    set nkey [my getKeyFromBody $value]
    if {[lindex $nkey 0] eq ""} return
    if {$key ne $nkey} {
        my registerKeyForInstance $nkey
        set key $nkey
    }
    IDE::MethodEditSynchronizatorMix instvar synchArr synchEditors
    if {$editMode eq "xotcl" && [info exists synchArr($key)]} {
        set viewList $synchArr($key)
        set twin [my getTextWindow]
        foreach view $viewList {
            if {$view ne $instance && [Object isobject $view]} {
                if {[$view hasModifications]} {
                    IDE::Dialog message "There are also modified unsaved $method in another view. No view synchronisation. Please beware your changes"
                    continue
                }
                if {![info exists dump]} {
                    set dump [$twin dump -text -tag 1.0 end]
                }
                set targetWin [$view getTextWindow]
                $targetWin configure -undo 0
                $targetWin delete 1.0 end
                set currTags [list]
                foreach {key value index} $dump {
                    switch $key {
                        text {
                            $targetWin insert $index $value $currTags
                        }
                        tagon {
                            lappend currTags $value
                        }
                        tagoff {
                            ide::lremove currTags $value
                        }
                    }
                }
                $targetWin configure -undo 1
                $targetWin edit modified 0
            }
        }
    }
}
