proc ide::lselect {var_ref list test} {
	upvar $var_ref var
        set ret {}
        foreach a $list {
            set var $a
            set rtest [uplevel [list expr $test]]
	    if $rtest {
                lappend ret $var
            }
        }
        return $ret
}
