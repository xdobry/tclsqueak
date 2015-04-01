IDE::InstallerGUI instproc initRun {} {
    # list of inputParameters test_proc install_proc description
    [self] set runTransitions {
{welcomeGUI checkDummy setDummy
            {Welcome to Installation tool for TclSqueak Version Control.

This tool can configure your sql server connection, install the database, table schema and import all components.

In this Version following sql server are supported
1. mysql (by usining mysqltcl tcl interface lib see.
    http://www.xdobry.de/mysqltcl)
2. postgresql - postgresql-tcl (destributed with postgresql - under RedHat install postgresql-tcl rpm package)
3. odbc - tclodbc see http://www.sourceforge.org/projects/tclodbc
4. sqlite - see http://www.sqlite.org (Adaptor Author Oleg Oleinick)
5. MS SQL Jet (.mdb access files) Windows only by odbc
6. MS SQL Server (by odbc)
7. Oracle

By Windows version mysqltcl, tclodbc and sqlite are included in binary distribution.

To use Version Control in XotclIDE you need:
1. Install and run your sql server.
2. Check your user access to databes (connection parameters)
3. For most sql-servers you need to create an empty new database. Only by mysql you can create new database from install program).
4. For ODBC and MS SQL Server create a database source (with new empty database)
}}

{selectInterfaceGUI checkInterface setInterface
            {Select the tcl interface to connect your sql-server}}

{sqlParamGUI checkSqlParam setSqlParam
            {Specify the Sql connection parameters.
The parameters are dependent from your sql interface. Check manuals for your database and/or your sql interface} }
{finalGUI checkInstallComponents installComponents
            { You can copy all XotclIDE components to Version Control. So you can start them directly by loading from Database (use start per 'CompLoaderDevelop'.

You will be asked for long name for your XotclIDE user. The short name is your unix system user name. It will be used to set the author of the copied components

Set the second check box if you want to save your connection parameter to user preferences in file ~/.xotclide.
Warning! Mysql password will be saved too} }
    }
}
