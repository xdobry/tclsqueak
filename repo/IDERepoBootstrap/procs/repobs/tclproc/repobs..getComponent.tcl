proc repobs::getComponent {compName dir {withComments 0}} {
    set source [getSourceFromDir [file join $dir [asFileName $compName]] $withComments]
    return $source
}
