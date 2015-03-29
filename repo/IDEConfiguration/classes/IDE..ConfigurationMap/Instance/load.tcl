IDE::ConfigurationMap instproc load {} {
    set llist [ide::lcollect each [my getComponents] {list [$each getName] [$each set componentid]}]
    IDE::SystemConfigMap loadComponentsFromList $llist
}
