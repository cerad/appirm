<?php
################################################################################
#                                  CHANGELOG                                   #
################################################################################
#  11/2002 - G. hartlieb: Created                                              #
################################################################################

include_once("../include/irm_conf.php");
include_once("../include/func.header_footer");
include_once("../include/class.user");

include_once("../include/func.showticket");
include_once("../include/func.listfollowups");
include_once("../include/func.formknowledgebase");

// Required inputs: 
//    $tablename - name of table in batabase
//    $ID        -  item unique ID

// Do Authorization
AuthCheck("post-only");

if ( $changed == 'yes' ) {

  // Update Customer and computer_id in Tracking Table
  $sql = "UPDATE tracking ";
  $sql .= " SET ";
  $sql .= " customer    = '$customer',";
  $sql .= " computer_id = '$computer_id'";
  $sql .= " WHERE ID = '$ID'";

  // Execute SQL 
  //   Mysql: Value Matches Current Value 0 Rows Returned
  $count = $adb->dbh_do($sql);
  if ( mysql_errno() )  {
     print(mysql_error().': '.$sql);
  }

  if ( $count = 0 ) $message = "Same values selected";
}

// Create Page title
$name = ucfirst($tablename);

commonHeader("Daedalus $name - Info");

$message && print "<p>$message</p><hr noshade>";

echo "<form method=POST action=\"tracking-update.php\">";

showTicket($ID);

$num_followups = listFollowups($ID);

formKnowledgebase();

echo "<input type=hidden name=tID value=$ID>";
echo "<input type=hidden name=fcount value=$num_followups>";

echo "<input type=submit value=\"Update Tracking\"><br>";

echo "</form>";


commonFooter();

?>
