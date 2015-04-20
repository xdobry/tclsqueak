IDE::TOOIntroProxy instproc testATclOOProxy {} {
    my instvar tclass tobject
    my createSampleClass
    set p [IDE::TclOOIntroProxy getIntroProxy]
    $p getBaseObjDef $tclass
    $p getBodyInstanceMethod $tclass foo
    $p getBodyClassMethod $tclass bar
    $p getBodyInstanceMethodIfExist $tclass unk
    $p getBodyClassMethodIfExist $tclass unk
    $p getHeritageForClass $tclass
    $p getHeritageFlatForClass $tclass
    $p getHeritageFlatPrecedenceForClass $tclass
    $p getDeepChildrenForClass $tclass
    $p setMetadataForObject $tclass comment mycomment
    my assert {[$p getMetadataForObject $tclass comment] eq "mycomment"}
    my assert {[$p hasMetadataForObject $tclass comment]}
    my assert {[$p hasMetadataNotEmptyForObject $tclass comment]}
    $p getMetadataForObject $tclass unknown
    $p getMetadataForObject unknown unknown
    $p getCategoriesForClass $tclass
    $p getCategoriesForObject $tclass
    my assert {"bar" in [$p getClassMethods $tclass _all_categories]}
    my assert {"foo" in [$p getInstanceMethods $tclass _all_categories]}
    my assert {"_constructor" in [$p getInstanceMethods $tclass _all_categories]}
    my assert {"_destructor" in [$p getInstanceMethods $tclass _all_categories]}
    $p getBodyInstanceMethod $tclass _constructor
    $p getBodyInstanceMethod $tclass _destructor
    $p moveToCategoryBForObject $tclass foo mycat {}
    my assert {"mycat" in [$p getCategoriesForClass $tclass]}
    my assert {"foo" in [$p getInstanceMethods $tclass mycat]}

    # comments

    my assert {![$p hasCommentForObject $tclass]}
    $p setCommentForObject $tclass comment
    my assert {[$p hasCommentForObject $tclass]}
    my assert {[$p getCommentForObject $tclass] eq "comment"}
    $p setCommentForObject $tclass ""
    my assert {![$p hasCommentForObject $tclass]}

    my assert {![$p hasMethodCommentForObject $tclass Instance foo]}
    $p setMethodCommentForObject $tclass Instance foo foocomment
    my assert {[$p hasMethodCommentForObject $tclass Instance foo]}
    my assert {[$p getMethodCommentForObject $tclass Instance foo] eq "foocomment"}
    $p setMethodCommentForObject $tclass Instance foo ""
    my assert {![$p hasMethodCommentForObject $tclass Instance foo]}

    $tclass destroy
}
