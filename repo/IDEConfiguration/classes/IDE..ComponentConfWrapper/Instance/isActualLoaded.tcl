IDE::ComponentConfWrapper instproc isActualLoaded {} {
    set cobj [IDE::Component getCompObjectForNameIfExist [my name]]
    expr {$cobj ne "" && [$cobj isPersistent] && [$cobj set componentid]==[my set componentid]}
}
