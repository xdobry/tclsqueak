IDE::FindReplace proc actionReplace {} {
    my instvar cur view backwards replaceText replaceAll prompt regularExpresion
    set count [my findArea]
    set twin [$view getTextWindow]
    if {$regularExpresion} {
        set localReplaceText [subst -nocommands -novariables $replaceText]
    } else {
        set localReplaceText $replaceText
    }
    while {$count>0} {
        set ignore 0
        if {$prompt} {
            $twin tag remove sel 1.0 end
            $twin tag add sel $cur "$cur + $count char"
            $twin see $cur
            if {$replaceAll} {
                switch -- [IDE::Dialog yesNoCancel [::msgcat::mc "Replace occurance %s" $cur]] {
                    no {
                        set ignore 1
                    }
                    cancel {
                        break
                    }
                }
            } else {
                if {[IDE::Dialog yesNo [::msgcat::mc "Replace occurance %s" $cur]] eq "no"} {
                    set ignore 1
                }
            }
        }
        if {!$ignore} {
            $twin delete $cur "$cur + $count char"
            $twin insert $cur $localReplaceText
        }
        if {!$backwards} {
            set cur "$cur + [string length $localReplaceText] char"
        }
        if {$replaceAll} {
            set count [my findArea 0]
        } else {
            break
        }
    }
}
