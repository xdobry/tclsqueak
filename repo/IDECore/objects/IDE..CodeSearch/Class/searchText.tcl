IDE::CodeSearch proc searchText {text searchDict} {
    set stext [dict get $searchDict text]
    set type [dict get $searchDict type]
    if {[dict exists $searchDict regexpr] && [dict get $searchDict regexpr] eq "0"} {
        set regexpr 0
    } else {
        set regexpr 1
    }
    if {[dict exists $searchDict caseSensitive] && [dict get $searchDict caseSensitive] eq "0"} {
        set caseSensitive 0
    } else {
        set caseSensitive 1
    }
    if {$type eq "word"} {
        set regexpr 1
        set stext \[\[:<:\]\]${stext}\[\[:>:\]\]
    }
    if {$regexpr} {
        if {$caseSensitive} {
            regexp -- $stext $text
        } else {
            regexp -nocase -- $stext $text
        }
    } else {
        if {$caseSensitive} {
            string match $stext $text
        } else {
            string match -nocase $stext $text
        }
    }
}
