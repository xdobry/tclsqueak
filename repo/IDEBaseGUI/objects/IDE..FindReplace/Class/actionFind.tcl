IDE::FindReplace proc actionFind {} {
    my instvar cur view backwards
    set count [my findArea]
    set twin [$view getTextWindow]
    if {$count>0} {
        # sel tag is not visible if text havn't focus
        $twin tag remove find 1.0 end
        $twin tag remove sel 1.0 end
        $twin tag add find $cur "$cur + $count char"
        $twin tag add sel $cur "$cur + $count char"
        $twin tag configure find -background yellow
        $twin mark set insert "$cur + $count char"
        $twin see insert
        if {!$backwards} {
            set cur "$cur + $count char"
        }
    }
}
