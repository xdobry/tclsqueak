proc Wikit::Format::render text {
	# Rendering of regular text: links, markup, brackets.

	# The main idea/concept behind the code below is to find the
	# special features in the text and to isolate them from the normal
	# text through special markers (\0\1...\0). As none of the regular
	# expressions will match across these markers later passes
	# preserve the results of the preceding passes. At the end the
	# string is split at the markers and then forms the list to add to
	# the internal representation. This way of doing things keeps the
	# difficult stuff at the C-level and avoids to have to repeatedly
	# match and process parts of the string.

	upvar irep irep
	variable codemap

	## puts stderr \]>>$irep<<\[
	## puts stderr >>>$text<<<

	# Detect page references, external links, bracketed external
	# links, brackets and markup (hilites).

	# Complex RE's used to process the string
	set pre  {\[([^\]]*)]}  ; # page references ; # compat
	set lre  {\m(https?|ftp|news|mailto|file):(\S+[^\]\)\s\.,!\?;:'>"])} ; # links
	set blre "\\\[\0\1u\2(\[^\0\]*)\0\\\]"

	# " - correct emacs hilite

	# Order of operation:
	# - Remap double brackets to avoid their interference.
	# - Detect embedded links to external locations.
	# - Detect brackets links to external locations (This uses the
	#   fact that such links are already specially marked to make it
	#   easier.
	# - Detect references to other wiki pages.
	# - Render bold and italic markup.
	#
	# Wiki pages are done last because there is a little conflict in
	# the RE's for links and pages: Both allow usage of the colon (:).
	# Doing pages first would render links to external locations
	# incorrectly.
	#
	# Note: The kiwi renderer had the order reversed, but also
	# disallowed colon in page titles. Which is in conflict with
	# existing wiki pages which already use that character in titles
	# (f.e. [COMPANY: Oracle].

	# Make sure that double brackets do not interfere with the
	# detection of links.
	regsub -all {\[\[} $text {\&!} text

	## puts stderr A>>$text<<*

	# Isolate external links.
	regsub -all $lre $text "\0\1u\2\\1:\\2\0" text
	## puts stderr C>>$text<<*

	# External links in brackets are simpler cause we know where the
	# links are already.
	regsub -all $blre $text "\0\1x\2\\1\0" text
	## puts stderr D>>$text<<*

	# Now handle wiki page references
	regsub -all $pre $text "\0\1g\2\\1\0" text
	## puts stderr B>>$text<<*

	# Hilites are transformed into on and off directives.
	# This is a bit more complicated ... Hilites can be written
	# together and possible nested once, so it has make sure that
	# it recognizes everything in the correct order!

	# Examples ...
	# {''italic'''''bold'''}         {} {<i>italic</i><b>bold</b>}
	# {'''bold'''''italic''}         {} {<b>bold</b><i>italic</i>}
	# {'''''italic_bold'''''}        {} {<b><i>italic_bold</i></b>}

	# First get all un-nested hilites
	while {
	    [regsub -all {'''([^']+?)'''} $text "\0\1b+\0\\1\0\1b-\0" text] ||
	    [regsub -all {''([^']+?)''}   $text "\0\1i+\0\\1\0\1i-\0" text]
	} {}

	# And then the remaining ones. This also captures the hilites
	# where the highlighted text contains single apostrophes.

	regsub -all {'''(.+?)'''} $text "\0\1b+\0\\1\0\1b-\0" text
	regsub -all {''(.+?)''}   $text "\0\1i+\0\\1\0\1i-\0" text


	# Normalize brackets ...
	set text [string map {&! [ ]] ]} $text]

	# Listify and generate the final representation of the paragraph.

	## puts stderr *>>$text<<*

	foreach item [split $text \0] {
	    ## puts stderr ====>>$item<<<

	    set cmd {} ; set detail {}
	    foreach {cmd detail} [split $item \2] break
	    set cmd [string trimleft $cmd \1]

	    ## puts stderr ====>>$cmd|$detail<<<

	    switch -exact -- $cmd {
		b+    {lappend irep b 1}
		b-    {lappend irep b 0}
		i+    {lappend irep i 1}
		i-    {lappend irep i 0}
		default {
		    if {$detail == {}} {
			# Pure text
			if {$cmd != ""} {
			    lappend irep {} $cmd
			}
		    } else {
			# References.
#2003-06-20: remove whitespace clutter in page titles
			regsub -all {\s+} [string trim $detail] { } detail
			lappend irep $cmd $detail
		    }
		}
	    }

	    ## puts stderr ======\]>>$irep<<\[
	}
	## puts stderr ======\]>>$irep<<\[
	return
    }
