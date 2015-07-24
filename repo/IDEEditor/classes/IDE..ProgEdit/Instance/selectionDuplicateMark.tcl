IDE::ProgEdit instproc selectionDuplicateMark {} {
    # mark the same string as selection if word
    my instvar isSelectionSilbing
    set twin [my getTextWindow]
    if {$isSelectionSilbing} {
        $twin tag remove silbingSelect 1.0 end
    }
    set selection [my getSelection]
    set len [string length $selection]
    if {$len>1 && [regexp {^\w+$} $selection]} {
        foreach s [$twin search -all -regexp "$selection" 1.0] {
            if {"sel" ni [$twin tag names $s]} {
                $twin tag add silbingSelect $s "$s + $len c"
                set isSelectionSilbing 1
            }
        }
    }
    return 1
}
