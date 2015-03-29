proc Wikit::Format::quote q {
	regsub -all {&} $q {\&amp;}  q
	regsub -all {"} $q {\&quot;} q ; # "
	regsub -all {<} $q {\&lt;}   q
	regsub -all {>} $q {\&gt;}   q
	regsub -all {&amp;(#\d+;)} $q {\&\1}   q
	return $q
    }
