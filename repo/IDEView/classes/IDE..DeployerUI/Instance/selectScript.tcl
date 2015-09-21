IDE::DeployerUI instproc selectScript {} {
    my instvar win startScript startScripts
    [self]::@startScript setText [$win.sframe.scripts get]
}
