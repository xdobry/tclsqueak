IDE::Debugger proc startDebugging {{addInfo {}}} {
    my instvar shouldHalt debugCount
    if {![info exists shouldHalt] || $shouldHalt==1} {
        if {$debugCount<10} {
            incr debugCount
            set inst [my new [Object autoname .debuger]]
            if {$addInfo ne ""} {
                $inst setTitleAddition $addInfo
                $inst set haltParam $addInfo
            }
            $inst startBrowsing
            $inst destroy
            incr debugCount -1
        }
    }
}
