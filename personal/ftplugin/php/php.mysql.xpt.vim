XPTemplate priority=lang

XPT phpmysqlcc "connection code
$host   = "`host^ChooseStr("localhost","127.0.0.1")^";
$user   = "`^";
$passwd = "`^";
$dbname = "`^";
$`connection name^ = mysqli_connect($host, $user, $passwd, $dbname) or die("`cant connect^");