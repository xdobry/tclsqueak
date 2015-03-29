IDE::RelationshipProxy instproc updateList {} {
    my instvar objectList indexList
    # add variables (ordArr)
    set sourceId [[my getSourceInstance] getIdValue]
    if {$objectList eq ""} {
        foreach index $indexList {
            [my relMapping] removeIndexForSourceId $sourceId [lindex $index 0]
        }
        return
    }
    foreach obj $objectList {
        if {![$obj isInDB]} {
            $obj makePersistent
        }
        lappend newIndex [$obj getIdValue]
    }
    # remove loop
    set mIndex {}
    foreach indexPaar $indexList {
        if {![ide::lcontain $newIndex [lindex $indexPaar 0]]} {
            [my relMapping] removeIndexForSourceId $sourceId [lindex $indexPaar 0]
        } else {
            lappend mIndex $indexPaar
        }
    }
    set indexList $mIndex
    # compute orderIndex array and build cleaned old index list
    set oldIndex {}
    foreach indexPaar $indexList {
        lappend oldIndex [lindex $indexPaar 0]
        set ordArr([lindex $indexPaar 0]) [lindex $indexPaar 1]
    }
    # reorder elements (ignore new not inserted elements first)
    # build new index list without new inserted elements
    set cnewIndex {}
    foreach i $newIndex {
        if {[info exists ordArr($i)]} {lappend cnewIndex $i}
    }
    set newGroupIndex [my buildGroupList $cnewIndex $oldIndex]
    if {[llength $newGroupIndex]>1} {
        for {set i 0} {$i<[llength $newGroupIndex]-1} {incr i} {
            set elem [lindex $newGroupIndex $i]
            set nextElem [lindex $newGroupIndex [expr {$i+1}]]
            if {$ordArr([lindex $elem end])>$ordArr([lindex $nextElem 0])} {
                # the group have false sequence
                if {[llength $elem]>=[llength $nextElem]} {
                    set relList $nextElem
                    set min $ordArr([lindex $elem end])
                    if {$i>=[llength $newGroupIndex]-2} {
                        set max [expr {$ordArr([lindex [lindex $newGroupIndex [expr {$i+1}]] 0])+2.0}]
                    } else {
                        set max $ordArr([lindex [lindex $newGroupIndex [expr {$i+2}]] 0])
                    }
                } else {
                    set relList $elem
                    set max $ordArr([lindex $nextElem 0])
                    if {$i==0} {
                        set min 0.0
                    } else {
                        set min $ordArr([lindex [lindex $newGroupIndex [expr {$i-1}]] end])
                    }
                }
                set skip [expr {($max-$min)/([llength $relList]+1)}]
                foreach uelem $relList {
                    set min [expr {$min+$skip}]
                    set ordArr($uelem) $min
                    [my relMapping] changeOrderIndexForSourceId $sourceId $uelem $min
                }
            }
        }
    }
    # insert new elements
    for {set i 0} {$i<[llength $newIndex]} {incr i} {
        set elem [lindex $newIndex $i]
        if {![info exists ordArr($elem)]} {
            # search prev element
            if {$i==0} {
                set min 0.0
            } else {
                set min $ordArr([lindex $newIndex [expr {$i-1}]])
            }
            # search the next element that has valid order value 
            for {set x $i} {$x<[llength $newIndex]} {incr x} {
                set nextid [lindex $newIndex $x]
                if {[info exists ordArr($nextid)]} {
                    break
                } else {
                    set nextid {}
                }
            }
            if {$nextid eq ""} {
                if {$i==0} {
                    set max 2.0
                } else {
                    set max [expr {$ordArr([lindex $newIndex [expr {$i-1}]])+2.0}]
                }
            } else {
                set max $ordArr($nextid)
            }
            set value [expr {($min+$max)/2}]
            [my relMapping] addIndexForSourceId $sourceId $elem $value
            set ordArr($elem) $value
        }
    }
    # rebuild new indexList
    set indexList {}
    foreach elem $newIndex {
        lappend indexList [list $elem $ordArr($elem)]
    }
}
