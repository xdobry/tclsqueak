IDE::ScriptEditor instproc debugScript {} {
    set text [[self]::editor getText]
    if {$text ne ""} {
        atk::debugScript $text
    }
}
