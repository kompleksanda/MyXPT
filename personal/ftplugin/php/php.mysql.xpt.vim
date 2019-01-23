XPTemplate priority=lang

XPT phpmysqlicnt "mysqli connect
mysqli_connect(`hostname^, `username^, `password^`, `databasename?`^)

XPT mysqli_error "mysqli error
`$_xSnipName^($`connection^)

XPT mysqli_close alias=mysqli_error "mysqli close connection

XPT mysqli_errno alias=mysqli_error "mysqli error number

XPT mysqli_insert_id alias=mysqli_error "mysqli insert id

XPT mysqli_fetch_array "mysqli fetch array
`$_xSnipName^($`result^)

XPT mysqli_fetch_assoc alias=mysqli_fetch_array "mysqli fetch assoc

XPT mysqli_fetch_row alias=mysqli_fetch_array "mysqli fetch row

XPT mysqli_num_rows alias=mysqli_fetch_array "mysqli num rows

XPT phpmysqliq "mysqli query
mysqli_query($`connection^, `str sql query^)

XPT phpmysqlis "mysqli select database
mysqli_select($`connection^, `database name^)

XPT phpmysqlires "mysqli real escape string
mysqli_real_escape_string($`connection^, `data^)

XPT phpmysqlcc "connection code
$host   = "`^";
$user   = "`^";
$passwd = "`^";
$dbname = "`^";
$`connection name^ = `:phpmysqlicnt({"hostname":"\$host","username":"\$user","password":"\$passwd","databasename?":"\$dbname"}):^ or die("`cant connect^")
..XPT
