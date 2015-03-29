TestArgumentChecker instproc parseCommand {parameters argDescs} {
    #puts "parsing '$parameters' '$argDescs'"

    if {[catch {my parseCommandTypes $parameters $argDescs} types]} {
        #puts "parsed types $types"
        return -1
    } else {
        return [llength $types]
    }
}
