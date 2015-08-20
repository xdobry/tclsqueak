IDE::CodeSearchDialog instproc postOk {} {
    my instvar search caseSensitive text searchType scope context
    set search [dict create text $text scope $scope caseSensitive $caseSensitive]
    IDE::InputCache addValueCache search $text
    if {$searchType eq "regexp"} {
        dict set search type text
        dict set search regexp 1
    } else {
        dict set search type $searchType
        dict set search regexp 0
    }
    if {$scope eq "component"} {
        dict set search context [dict get $context component]
    } elseif {$scope eq "object"} {
        dict set search context [dict get $context object]
        set cobj [IDE::Component getCompObjectForNameIfExist [dict get $context component]]
        if {$cobj ne ""} {
            dict set search introProxy [$cobj getIntroProxy]
        }
    }
    IDE::InputCache setValueCache codeSearchPrefs [dict create scope $scope searchType $searchType caseSensitive $caseSensitive]
}
