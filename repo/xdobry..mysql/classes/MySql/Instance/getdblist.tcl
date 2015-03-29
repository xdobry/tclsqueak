MySql instproc getdblist {} {
    mysqlinfo [my set handle] databases
}
