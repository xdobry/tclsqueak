IDE::HeritageClassView instproc fillMenuStruct ms {
    next
    $ms addCommand Refresh [list [self] refresh]
}
