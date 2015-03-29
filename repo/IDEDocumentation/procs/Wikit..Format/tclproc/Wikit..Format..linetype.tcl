proc Wikit::Format::linetype line {
	# Categorize a line of wiki text based on indentation and prefix

	set line [string trimright $line]

	## Compat: retain tabs ...
	## regsub -all "\t" $line "    " line
	#
	## More compat'ibility ...
	## The list tags allow non-multiples of 3 if the prefix contains at
	## least 3 spaces. The standard wiki accepts anything beyond 3 spaces.
	## Keep the kiwi regexes around for future enhancements.

	foreach {tag re} {
	    UL	{^(   + {0,2})(\*) (\S.*)$}
	    OL	{^(   + {0,2})(\d)\. (\S.*)$}
	    DL	{^(   + {0,2})([^:]+):   (\S.*)$}

	    UL	{^(   +)(\*) (\S.*)$}
	    OL	{^(   +)(\d)\. (\S.*)$}
	    DL	{^(   +)([^:]+):   (\S.*)$}
	} {
	    # Compat: Remove restriction to multiples of 3 spaces.

	    if {[regexp $re $line - pfx aux txt] } {
		#    && string length $pfx % 3 == 0
		return [list $tag [expr {[string length $pfx]/3}] $txt $aux]
	    }
	}

	# Compat: Accept a leading TAB is marker for quoted text too.

	if {([string index $line 0] == " ") || ([string index $line 0] == "\t")} {
	    return [list PRE 1 $line]
	}
	if {[regexp {^-{4,}$} $line]} {
	    return [list HR 0 $line]
	}
	return [list STD 0 $line]
    }
