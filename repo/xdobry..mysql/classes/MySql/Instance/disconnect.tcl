MySql instproc disconnect {} {
    mysqlclose [my set handle]
    my set connected 0
}
