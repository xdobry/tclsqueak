IDE::CodeController instproc handleComponent {skript contentDesc} {
    set cobj [IDE::Component getCompObjectForNameIfExist [lindex $contentDesc 0]]
    if {$cobj ne ""} {
        $cobj setComment $skript
    }
    return $contentDesc
}
