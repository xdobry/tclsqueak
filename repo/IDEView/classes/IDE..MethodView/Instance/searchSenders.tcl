IDE::MethodView instproc searchSenders range {
    my instvar vclass
    set text [my selectedItemFirst]
    if {$text ne ""} {
        set pattern \[\[:<:\]\]${text}\[\[:>:\]\]
        switch -- $range {
            local {IDE::MethodBrowser searchTextClass $pattern $vclass $text [my getIntroProxy]}
            component {
                IDE::MethodBrowser searchTextComponent $pattern [my getComponentInContext] $text
            }
            all {IDE::MethodBrowser searchTextAll $pattern $text}
        }
    }
}
