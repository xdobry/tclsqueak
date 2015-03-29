IDE::SyntaxCheckMethodList instproc browseHeritage actual {
    set item [split $actual >]
    set vclass [lindex [lindex $item 0] 0]
    if {[Object isclass $vclass]} {
        IDE::HeritageBrowser newBrowser $vclass
    } else {
        my upsMessage "$vclass is not a class"
    }
}
