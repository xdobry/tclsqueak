IDE::CompViewDB instproc isSelectedNotPersistent {} {
    set cobj [IDE::Component getCompObjectForNameIfExist [my set vcomponent]] 
    expr {$cobj eq "" || ![$cobj isPersistent]}
}
