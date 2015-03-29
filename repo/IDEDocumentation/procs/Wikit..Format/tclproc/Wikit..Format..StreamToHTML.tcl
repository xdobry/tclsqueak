proc Wikit::Format::StreamToHTML {s {cgi {}} {ip {}}} {
	set result ""
	set state H   ; # bogus hline as initial state.
	set vstate "" ; # Initial state of visual FSM
	set count 0
	variable html_frag

	foreach {mode text} $s {
	    switch -exact -- $mode {
		{}    {append result [quote $text]}
		b - i {append result $html_frag($mode$text)}
		g {
		    if {$cgi == ""} {
			append result "\[[quote $text]\]"
			continue
		    }
		    if {$ip == ""} {
			# no lookup, turn into a searchreference
			append result  $html_frag(a_) $cgi$text $html_frag(tc)  [quote $text] $html_frag(_a)
			continue
		    }

		    set info [eval $ip [list $text]]
		    foreach {id name date} $info break

		    if {$id == ""} {
			# not found, don't turn into an URL
			append result "\[[quote $text]\]"
			continue
		    }

		    regsub {^/} $id {} id
		    if {$date > 0} {
			# exists, use ID
			append result  $html_frag(a_) $id $html_frag(tc)  [quote $text] $html_frag(_a)
			continue
		    }

		    # missing, use ID -- editor link on the brackets.
		    append result  $html_frag(a_) $id $html_frag(tc) \[ $html_frag(_a)  [quote $text]  $html_frag(a_) $id $html_frag(tc) \] $html_frag(_a)  }
		u {
		    append result  $html_frag(a_) $text $html_frag(tc)  [quote $text] $html_frag(_a)
		}
		x {
		    if {[regexp {\.(gif|jpg|png)$} $text]} {
			append result $html_frag(i_) $text $html_frag(tc)
		    } else {
			append result  \[ $html_frag(a_) $text $html_frag(tc)  [incr count] $html_frag(_a) \]
		    }
		}
		T - Q - I - D - U - O - H {
		    append result $html_frag($state$mode)
		    set state $mode
		}
	    }
	}
	# Close off the last section.
	append result $html_frag(${state}_)
	# Get rid of spurious newline at start of each quoted area.
	regsub -all "<pre>\n" $result "<pre>" result
	list $result {}
    }
