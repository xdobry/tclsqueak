IDE::ProtocolText instproc init win {
    next
    my instvar odd protocolOn count itemLines
    $win.text tag configure odditem -background cornsilk3

    frame $win.wbox
    button $win.wbox.clear -text Clear -command [list [self] clearProtocol]
    checkbutton $win.wbox.protocolon -text "Protocol on" -variable [self]::protocolOn
    entry $win.wbox.eitems -width 5 -textvariable [self]::itemsNumber
    entry $win.wbox.regexpr -width 20 -textvariable [self]::regexpr
    checkbutton $win.wbox.reinverse -text "inverse match" -variable [self]::inverseMatch
    label $win.wbox.lregexpr -text "Regular expresion match"
    label $win.wbox.litems -text "Number of items to hold"

    grid $win.wbox.clear -row 0 -column 0 -sticky ew
    grid $win.wbox.protocolon -row 1 -column 0 -padx 4 -pady 4
    grid $win.wbox.eitems -row 0 -column 1 -sticky e  -padx 4
    grid $win.wbox.regexpr -row 1 -column 1  -padx 4
    grid $win.wbox.litems -row 0 -column 2 -columnspan 2 -sticky w
    grid $win.wbox.lregexpr -row 1 -column 2 -sticky w
    grid $win.wbox.reinverse -row 1 -column 3

    pack $win.wbox -side bottom -before $win.scroll -anchor w
    set odd 0
    set protocolOn 1
    set count 0
    set itemLines {}
}
