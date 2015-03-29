IntroRepoBuilder instproc buildWidget widget {
    my instvar optTypes commandsArr methodsArr xotclObjectsArr
    lassign [my getWidgetOptionsCommands $widget] options methods

    if {[namespace qualifiers $widget] ne ""} {
        set widgetClass ::[namespace qualifiers $widget]::[string toupper [namespace tail $widget] 0 0]
    } else {
        set widgetClass ::[string toupper $widget 0 0]
    }

    set optionsDesc [list]
    foreach opt $options {
        if {[catch {set optTypes($opt)} type]} {
            set type unknown
        }
        lappend optionsDesc $opt $type
    }
    lappend command [list [list [list tk $widgetClass]] [list [list new tk $widgetClass] $widget] [list ? [concat option $optionsDesc]]]
    set commandsArr(::$widget) $command


    set xotclObjectsArr($widgetClass) [list Class ::widget {}]
    set methodsArr([list $widgetClass instproc cget]) [list [list unknown [list [concat enum $options]]]]
    lappend confMethod [list list]
    lappend confMethod [list void [list [concat option $optionsDesc]]]
    lappend confMethod [list list [list [concat enum $options]]]
    set methodsArr([list $widgetClass instproc configure]) $confMethod
    foreach m $methods {
        if {$m ni {cget configure}} {
            set methodsArr([list $widgetClass instproc $m]) {0 -1}
        }
    }

}
