proc Wikit::Format::rlinks text {
	# Convert everything which looks like a link into a link. This
	# command is called for quoted lines, and only quoted lines.

	upvar irep irep

	# Compat: (Bugfix) Added " to the regexp as proper boundary of an url.
	set re {\m(https?|ftp|news|mailto|file):(\S+[^\]\)\s\.,!\?;:'>"])}
	set txt 0
	set end [string length $text]

	## Find the places where an url is inside of the quoted text.

	foreach {match dummy dummy} [regexp -all -indices -inline $re $text] {
	    # Skip the inner matches of the RE.
	    foreach {a e} $match break
	    if {$a > $txt} {
		# Render text which was before the url
		lappend irep {} [string range $text $txt [expr {$a - 1}]]
	    }
	    # Render the url
	    lappend irep u [string range $text $a $e]
	    set txt [incr e]
	}
	if {$txt < $end} {
	    # Render text after the last url
	    lappend irep {} [string range $text $txt end]
	}
	return
    }
