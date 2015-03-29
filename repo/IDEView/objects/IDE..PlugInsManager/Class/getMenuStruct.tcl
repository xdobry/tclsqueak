IDE::PlugInsManager proc getMenuStruct ms {
    my instvar plugInsArr plugInsList
    if {![info exists plugInsArr]} return
    IDE::MenuStruct create ${ms}::extras {Plug Ins}
    $ms addCascadeMenu ${ms}::extras
    foreach key $plugInsList {
        set value $plugInsArr($key)
        set label [lindex $value 1]
        ${ms}::extras addCommand $label [list [self] loadExtras $key]
    }
}
