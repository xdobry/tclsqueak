IDE::BasePersistenceTest instproc testIHRelationshipManipulation {} {
    my instvar s1 s2 s3
    set s3 [IDE::SimplePersistenceClass new -name sample3]
    $s3 makePersistent
    ${s2}::childsamples setList [list $s1 $s3]
    ${s2}::childsamples updateList
    ${s2}::childsamples unset indexList
    my assert {[${s2}::childsamples getList]==[list $s1 $s3]}
    
    ${s2}::childsamples setList [list $s3]
    ${s2}::childsamples updateList
    ${s2}::childsamples unset indexList
    my assert {[${s2}::childsamples getList]==[list $s3]}

    ${s2}::childsamples setList [list $s3 $s1]
    ${s2}::childsamples updateList
    ${s2}::childsamples unset indexList
    my assert {[${s2}::childsamples getList]==[list $s3 $s1]}

    ${s2}::childsamples setList [list $s1 $s3]
    ${s2}::childsamples updateList
    ${s2}::childsamples unset indexList
    my assert {[${s2}::childsamples getList]==[list $s1 $s3]}

    ${s2}::childsamples setList [list $s3 $s1]
    ${s2}::childsamples updateList
    ${s2}::childsamples unset indexList
    my assert {[${s2}::childsamples getList]==[list $s3 $s1]}

    ${s2}::childsamples setList [list $s1]
    ${s2}::childsamples updateList
    ${s2}::childsamples unset indexList
    my assert {[${s2}::childsamples getList]==[list $s1]}

    ${s2}::childsamples setList [list $s3 $s1]
    ${s2}::childsamples updateList
    ${s2}::childsamples unset indexList
    my assert {[${s2}::childsamples getList]==[list $s3 $s1]}
}
