IDEStarter proc argumentsDescription {} {
    return {
        {-ignoreprefs bool {Do not read preferences}}
        {-nodialog bool {Try to entablish database connection without user dialog}}
        {-preferences string {list for overloading preferences f.e "interface mysqltcl dbank xotcllib"}}
        {-nosynchronize bool {do not synchronize Core Components}}
        {-configmap string {Configuration Map File}}
        {-configmapdb string {Configuration Map in version control}}
        {-help action {show parameter list and exit} showHelpAndExit}
        {-dumpcompid paraction {dump component with id to stdout} dumpCompId}
        {-dumpconfid paraction {dump configuration with id to stdout} dumpConfId}
        {-startconfid paraction {start application from configmap} startConfId}
        {-preloadcomponents string {Preload component on start from DB}}
        {-preexec string {Command which is evaluated upon starting}}
        {-startMode string {start mode: ideOnly ideDB ideFromDB installVC}}
    }
}
