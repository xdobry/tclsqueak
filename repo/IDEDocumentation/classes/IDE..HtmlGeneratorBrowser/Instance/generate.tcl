IDE::HtmlGeneratorBrowser instproc generate {} {
    my instvar win useWikit
    set docname [$win.docname.name get]

    set components [[self]::components selectedItem]
    if {$components eq ""} {
        IDE::Dialog message "No components selected"
        return
    }
    set dg [IDE::DocGeneratorMain new -volatile [list -components $components] [list -outdir [my set actualDir]] [list -ignorePrivate [my set ignorePrivateCategory]] [list -ignoreNoCommented [my set ignoreNoCommented]] [list -docname $docname] [list -wikitFormater $useWikit]]
    $dg generate
}
