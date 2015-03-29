IDE::MethodView instproc searchText range {
    my instvar vclass
    set sel [[my info parent]::methodedit getSelection]
    set text [IDE::IDialogEntry getValue {give search text (regular expresion)} $sel search]
    if {$text ne ""} {
        switch $range {
            local {IDE::MethodBrowser searchTextClass $text $vclass $text [my getIntroProxy]}
            component {
                IDE::MethodBrowser searchTextComponent $text [my getComponentInContext]
            }
            all {IDE::MethodBrowser searchTextAll $text}
        }
    }
}
