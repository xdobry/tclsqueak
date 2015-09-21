IDE::GuiClassBuilder instproc applyTemplate {template desc} {
    while {[regexp -indices {%%(.+?)%%} $template pattern script]} {
        set script [string range $template {*}$script]
        set value [my applyScript $script $desc]
        set template [string replace $template {*}$pattern $value]
    }
    return $template
}
