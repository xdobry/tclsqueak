IDE::CompViewDB instproc isSelectedPersistent {} {
    set cobj [IDE::Component getCompObjectForNameIfExist [my set vcomponent]] 
    expr {$cobj ne "" && [$cobj isPersistent]}
}
