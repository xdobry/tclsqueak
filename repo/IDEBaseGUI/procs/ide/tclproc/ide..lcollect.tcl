proc ide::lcollect {var_ref list eval_action} {
	upvar $var_ref var
        set ret {}
        foreach a $list {
            set var $a
            lappend ret [uplevel $eval_action]
	}
        return $ret
}
