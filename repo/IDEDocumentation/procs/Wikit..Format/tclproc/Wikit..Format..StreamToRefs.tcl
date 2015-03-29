proc Wikit::Format::StreamToRefs {s ip} {
	array set pages {}
	
	foreach {mode text} $s {
	    if {![string equal $mode g]} {continue}

          	    set info [eval $ip [list $text]]
	    foreach {id name date} $info break
	    if {$id == ""} {continue}

	    regexp {[0-9]+} $id id
	    set pages($id) ""
	}
	
	array names pages
    }
