IDE::TCore instproc testEProxyQuerring {} {
    set introProxy [IDE::XOIntroProxy getIntroProxy]
    $introProxy getBodyClassMethod TestC m1
    $introProxy getBodyInstanceMethod TestA m1
    $introProxy getCategoriesForClass TestA
    $introProxy getCategoriesForObject TestC
    $introProxy getClassMethods TestA _all_categories
    $introProxy getClassMethods TestC _all_categories
    $introProxy getClasses
    $introProxy getClassesForComponent TestCase
    $introProxy getComponentsNoIDE
    $introProxy getInstanceMethods TestA _all_categories
    $introProxy getObjDef TestA
    $introProxy getObjects
    $introProxy getObjectsForComponent TestCase
}
