IDE::EditionBrowser instproc selectMethod method {
    my instvar object vtype
    [self]::methodedit setText [$object get${vtype}MethodBody $method] 
}
