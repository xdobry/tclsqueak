Sqlite instproc buildTokenList sql {
    # build list of list of tokens first list is a columns list
    # "" token
    set tokens [list]
    # match ".+" expresions for DEFAULT
    foreach t [regexp -inline -all -- {[^"]+|"[^"]+?"} $sql] {
        if {[string index $t 0] ne "\""} {
            # match (.+) expresions
            foreach t2 [regexp -inline -all -- {[^(]+|\([^)]+?\)} $t] {
                if {[string index $t2 0] ne "("} {
                    # match words and delemiter ,
                    foreach t3 [regexp -inline -all -- {[^,]+|,} $t2] {
                        if {$t3 ne ","} {
                            # match [] masking
                            foreach t4 [regexp -inline -all -- {[^\[]+|\[[^\]]+?\]} $t3] {
                                if {[string index $t4 0] ne "\["} {
                                    foreach t5 [regexp -inline -all -- {\w+} $t4] {
                                        lappend tokens $t5
                                    }
                                } else {
                                    regexp {\[(.+)\]} $t4 _ inner
                                    lappend tokens $inner
                                }
                            }
                        } else {
                            lappend tokens $t3
                        }
                    }
                } else {
                    lappend tokens $t2
                }
            }
        } else {
            lappend tokens $t
        }
    }
    set columns [list]
    set column [list]
    foreach t $tokens {
        if {$t eq ","} {
            lappend columns $column
            set column [list]
        } else {
            lappend column $t
        }
    }
    lappend columns $column
    return $columns
}
