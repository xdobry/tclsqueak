IDE::FindReplace proc findArea {{complainNoFound 1}} {
    my instvar view findText caseSensitive backwards fromCursor selectedText regularExpresion cur stopIndex firstRun
    set tag find
    #[self] halt
    #IDE::Dialog message release
    set twin [$view getTextWindow]
    $twin tag remove $tag 0.0 end
    if {![my exists cur]} {
        my set cur 1.0
    }
    if {$fromCursor} {
        set cur [$twin index insert]
    }
    if {$selectedText && $firstRun} {
        set range [$twin tag ranges sel]
        if {$range ne ""} {
            set cur [lindex $range 0]
            set stopIndex [lindex $range 1]
        } else {
            set stopIndex end
        }
    } elseif {$firstRun} {
	set stopIndex end
    }
    if {$regularExpresion} {
        set match -regexp
    } else {
	set match -exact
    }
    if {!$caseSensitive} {
        set icase -nocase
    } else {
        set icase {}
    }
    if {$backwards} {
	set direction -backward
        if {$firstRun} {
           set t $cur
	   set cur $stopIndex
	   set stopIndex $t
        }
    } else {
	set direction -forward
    }
    set cur [$twin search -count search_count $direction $match {*}$icase -- $findText $cur $stopIndex]
    set firstRun 0
    if {$cur eq ""} {
        if {$complainNoFound} {
            IDE::Dialog message "Text \"$findText\" not found!"
        }
        set cur 1.0
	set stopIndex end
        set firstRun 1
        return 0
    }
    return $search_count
}
