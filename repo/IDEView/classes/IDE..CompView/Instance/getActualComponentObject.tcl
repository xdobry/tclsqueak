IDE::CompView instproc getActualComponentObject {} {
    set actual [my selectedItem]
    if {$actual eq ""} return
    return [IDE::Component getCompObjectForNameIfExist $actual]
}
