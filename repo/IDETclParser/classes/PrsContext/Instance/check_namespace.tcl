PrsContext instproc check_namespace {count command notifier} {
    my instvar repository namespace
    if {$count>=2} {
         set subcommand [$command getElem 1]
         set namespaceElem [$command getElem 2]
         if {[$subcommand isLiteral eval] && [$namespaceElem hasclass PrsLiteral] && $count>=3} {
             set snamespace [$namespaceElem prsString]
             set evalBody [$command getElem 3]
             if {[$evalBody hasclass PrsNoSubst]} {
                 my subParseGlobal $evalBody $notifier [my joinNamespace $snamespace]
             }
         } elseif {[$subcommand isLiteral export]} {
             set exportList [list]
             for {set i 2} {$i<=$count} {incr i} {
                 set elem [$command getElem $i]
                 if {[$elem hasclass PrsLiteral]} {
                     lappend exportList [$elem prsString]
                 }
             }
             if {[llength $exportList]>0} {
                 $repository addNamespaceExport $namespace $exportList
             }
         } elseif {[$subcommand isLiteral import]} {
             set importList [list]
             for {set i 2} {$i<=$count} {incr i} {
                 set elem [$command getElem $i]
                 if {[$elem hasclass PrsLiteral] && ![$elem isLiteral -force]} {
                     lappend importList [$elem prsString]
                 }
             }
             if {[llength $importList]>0} {
                 $repository addNamespaceImport $namespace $importList
             }
         }
    }
}
