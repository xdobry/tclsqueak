IDE::DocGenerator instproc getComment comment {
    my instvar wikitFormater
    if {$wikitFormater} {
        lindex [Wikit::Format::Expand_HTML $comment] 0
    } else {
        return "<pre>$comment</pre>"
    }
}
