IDE::CompViewDB instproc isSelectedEdition {} {
    set cobj [IDE::Component getCompObjectForNameIfExist [my set vcomponent]] 
    expr {$cobj ne "" && [$cobj isPersistent] && ![$cobj set isclosed]} 
}
