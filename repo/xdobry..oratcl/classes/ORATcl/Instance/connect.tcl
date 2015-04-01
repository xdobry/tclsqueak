ORATcl instproc connect par_list {
    [self] instvar handle connected datasource password user
    array set par_array $par_list
    foreach k {datasource user password} {
         my set $k $par_array($k)
    }
    if {[catch {set handle [oralogon $user/$password@$datasource]} err]!=0} {
        my errorMessage $err
        return 0
    }
    # set autocommit on true
    oraautocom $handle 1
    my set dbank $datasource
    set connected 1
    return 1
}
