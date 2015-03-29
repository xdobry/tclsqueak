proc ide::ldetect {var_ref list test} {
	upvar $var_ref var
        foreach a $list {
            set var $a
            set rtest [uplevel [list expr $test]]
	    if $rtest {
                return $a
            }
        }
        return
}
