PrsContext instproc createSubcontext {notifier elem} {
    my instvar repository parseMode
    set subContext [PrsSubContext new -childof $elem]
    $elem set context $subContext
    $subContext set repository $repository
    $subContext set parseMode $parseMode
    return $subContext
}
