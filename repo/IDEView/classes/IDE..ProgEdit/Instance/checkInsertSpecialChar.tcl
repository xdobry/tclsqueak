IDE::ProgEdit instproc checkInsertSpecialChar {} {
    my instvar isBraceHL
    set twin [my getTextWindow]
    set range [$twin tag ranges sel]
    if {[llength $range]==0} {
        set iindex [$twin index insert]
        set index [$twin index {insert - 1 c}]
        set bc [$twin get $index $iindex]
        set bindex [string first $bc "\{\[(" 0]
        if {$bindex>=0} {
            set cb [string index "\}\])" $bindex]
            set endindex [my searchCloseBrace [$twin get $index end] $bc $cb]
            if {$endindex!=-1} {
                $twin tag remove braceHL 1.0 end
                set endindex2 [expr {$endindex-1}]
                $twin tag add braceHL "$iindex + $endindex2 c" "$iindex + $endindex c"
                set isBraceHL 1
            }
            return
        }
        set bindex [string first $bc "\}\])" 0]
        if {$bindex>=0} {
            set cb [string index "\{\[(" $bindex]
            set endindex [my searchOpenBrace [$twin get 1.0 $iindex] $bc $cb]
            if {$endindex!=-1} {
                $twin tag remove braceHL 1.0 end
                set endindex2 [expr {$endindex-1}]
                $twin tag add braceHL "$iindex - $endindex c" "$iindex - $endindex2 c"
                set isBraceHL 1
            }
            return
        }
    }

    if {$isBraceHL} {
        $twin tag remove braceHL 1.0 end
        set isBraceHL 0
    }

}
