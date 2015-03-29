IDE::EditionsMultiChooser instproc selectName {{mobject {}}} {
    my instvar versionsArr
    if {$mobject eq ""} return
    my set selectedGroup $mobject
    [self]::@versions setObjectsList $versionsArr([$mobject name])
}
