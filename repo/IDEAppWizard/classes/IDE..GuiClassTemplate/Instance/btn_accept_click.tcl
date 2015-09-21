IDE::GuiClassTemplate instproc btn_accept_click {} {
    my instvar root textVariable
    tk_messageBox -parent $root -message "your imput was $textVariable"
}
