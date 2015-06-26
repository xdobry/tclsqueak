TclHtmlBuilder instproc putsNonewlineMasked text {
    my putsNonewline [string map {> &gt; < &lt; & &amp; \t "    "}  $text]
}
