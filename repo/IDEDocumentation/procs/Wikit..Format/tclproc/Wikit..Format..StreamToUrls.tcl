proc Wikit::Format::StreamToUrls s {
	array set urls {}
	foreach {mode text} $s {
	    if {$mode eq "u"} { set urls($text) imm }
	    if {$mode eq "x"} { set urls($text) ref }
	}
	array get urls
    }
