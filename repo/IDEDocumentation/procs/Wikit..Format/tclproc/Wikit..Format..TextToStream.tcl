proc Wikit::Format::TextToStream text {
	# Based upon ideas from the kiwi renderer. One step rendering into
	# the internal representation without a script as intermediate step.

	set irep      [list] ; # Internal representation generated here.
	set paragraph ""     ; # Buffer for the text of a single paragraph
	set empty_std 0      ; # Boolean flag. Set if the preceding line was empty.

	foreach line [split $text \n] {
	    # Per line, classify the it and extract the main textual information.
	    foreach {tag depth txt aux} [linetype $line] break ; # lassign

	    # Classification tags
	    #
	    # UL, OL, DL = Lists (unordered/bullet, ordered/enum,
	    #                     definition/itemized)
	    # PRE        = Verbatim / Quoted lines
	    # HR         = Horizontal rule
	    # STD        = Standard text

	    ## Whenever we encounter a special line, not quoted, any
	    ## preceding empty line has no further effect.
	    #
	    switch -exact -- $tag {
		HR - UL - OL - DL {set empty_std 0}
		default {}
	    }

	    ## Whenever we encounter a special line, including quoted, we
	    ## have to render the data of the preceding paragraph, if
	    ## there is any.
	    #
	    switch -exact -- $tag {
		HR - UL - OL - DL - PRE {
		    if {$paragraph != {}} {
			lappend irep T 0 ; render $paragraph
			set paragraph ""
		    }
		}
		default {}
	    }

	    ## Now processs the lines according to their types.
	    #
	    # Tag | depth         | txt             | pfx           | aux
	    # ----+---------------+-----------------+---------------+---------------
	    # UL  | nesting level | text of item    | before bullet | bullet
	    # OL  | nesting level | text of item    | before bullet | bullet
	    # DL  | nesting level | term definition | before bullet | term
	    # PRE | 1             | text to display |
	    # HR  | 0             | text of ruler   |
	    # STD | 0             | text to display |
	    # ----+---------------+-----------------+---------------+---------------

	    # HR     - Trivial
	    # UL, OL - Mark their beginning and then render their text
	    #        - like a normal paragraph.
	    # DL     - Like list item, except that there are two different
	    #          parts of text we have to render, term and term definition.
	    # PRE    - Quoted text is searched for links, but nothing
	    #          more. An empty preceding line is added to the
	    #          quoted section to keep it at a distance from the
	    #          normal text coming before.
	    # STD    - Lines are added to the paragraph until an empty one is
	    #          encountered. This closes the paragraph.

	    switch -exact -- $tag {
		HR  {lappend irep H 1}
		UL  {lappend irep U 0 ; render $txt}
		OL  {lappend irep O 0 ; render $txt}
		DL  {
		    lappend irep I 0 ; render $aux
		    lappend irep D 0 ; render $txt
		}
		PRE {
		    # Transform a preceding 'STD {}' into an empty Q line,
		    # i.e make it part of the verbatim section, enforce
		    # visual distance.

		    if {$empty_std} {lappend irep Q 0 {} {}; set empty_std 0}
		    lappend irep Q 0
		    if {$txt != {}} {rlinks $txt}
		}
		STD {
		    if {$txt == {}} {
			if {$paragraph != {}} {
			    lappend irep T 0 ; render $paragraph
			    set paragraph ""
			}
			set empty_std 1
		    } else {
			if {$paragraph != {}} {append paragraph " "} 
			append paragraph $txt
			set empty_std 0
		    }
		}
		default {
		    error "Unknown linetype $tag"
		}
	    }
	}

	# Render the last paragraph, if any.

	if {$paragraph != {}} {
	    lappend irep T 0 ; render $paragraph
	}

	return $irep
    }
