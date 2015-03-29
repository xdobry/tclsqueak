IDE::ProgEdit instproc getBaseCmdFromLine cmdline {
    # search for first cmd in line
    # skip [ and ; {}
    set cmdline [string map [list {\}} _ {\{} _ {\"} _ {\]} _ {\[} _] $cmdline]

    while {[set i [string last {[} $cmdline]]>0} {
        if {[set b [string first {\]} $cmdline $i]]>=0} {
            set cmdline [string replace $cmdline $i $b _]
        } else {
            break
        }
    }

    while {[set i [string last \{ $cmdline]]>0} {
        if {[set b [string first \} $cmdline $i]]>=0} {
            set cmdline [string replace $cmdline $i $b _]
        } else {
            break
        }
    }

    while {[set i [string last {"} $cmdline]]>0} {
        if {[set b [string last {"} $cmdline [expr {$i-1}]]]>=0} {
            set cmdline [string replace $cmdline $b $i _]
        } else {
            break
        }
    }

    set start 0
    if {[set s [string last ";" $cmdline]]>0} {
        incr s
        set start $s
    }
    if {[set s [string last {\[} $cmdline]]>0 && $s>$start} {
        incr s
        set start $s
    }
    set cmdline [string range $cmdline $start end]
    if {[regexp {^\s*(\w+)} $cmdline _ basecmd]} {
        return $basecmd
    }
    return
}
