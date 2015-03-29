IDE::ConfigmapControler proc updateText {} {
    my instvar selectedVersion view viewType
    if {$selectedVersion eq ""} return
    switch $viewType {
        Comment {
            set text [$selectedVersion getComment]
        }
        preStartScript {
            set text [$selectedVersion prescript]
        }
        startScript {
            set text [$selectedVersion postscript]
        }
    }
    ${view}::text setTextControler $text [self]
}
