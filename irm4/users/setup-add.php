<?php

include_once("../include/irm_conf.php");
include_once("../include/class.user");
include_once("../include/func.header_footer");

include_once("../include/func.irm");

AuthCheck("tech");
$query = "INSERT INTO $tablename VALUES ('$name')";
$count = $adb->dbh_do($query);
logevent(-1, "IRM", 5, "setup", "$IRMName added entry $name to $tablename.");
header("Location: $HTTP_REFERER");
?>
