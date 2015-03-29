IDE::EditionChooser instproc postOk {} {
    my set result [[self]::@versions getSelectedObjects]
}
