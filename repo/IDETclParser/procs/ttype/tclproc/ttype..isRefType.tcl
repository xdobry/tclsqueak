proc ttype::isRefType type {
    expr {[lindex $type 0] in {wref setref ref gref setgref}}
}
