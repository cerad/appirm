<?php
/*
 * $title
 * $content
 * $cfg_sendexpire
 * $user
 * $dbName
 * 
 * Is this really necessary?
    header("Expires: Fri, Jun 12 1981 08:20:00 GMT Pragma: no-cache");
*/?>
<!-- Daedalus is (c) 2005  -->
<html>
<head>
<title>Daedalus: <?php echo $title; ?></title>
<link href="../include/irm.css" rel="stylesheet" type="text/css">
<?php if ($cfg_sendexpire == 1) { ?>
<meta http-equiv=\"Expires\" content=\"Fri, Jun 12 1981 08:20:00 GMT\">
<meta http-equiv=\"Pragma\" content=\"no-cache\">
<meta http-equiv=\"Cache-Control\" content=\"no-cache\">
<?php } ?>
</head>
<?php // User is passed in ?>

<table cellspacing=0 border=0 height=20 width=100%>
<tr>
  <th align=left><?php echo $title; ?></th>
  <td align=right>
    <a href="index.php"><img src=$PREFIX/$LOGO border=0></a>
  </td>
</tr>
<tr height=20>
<td>
    <a href="newticket.php">New Ticket</a>
  | <a href="tracking-index.php">Tracking</a> 
  | <a href="reports-index.php">Reports</a>
  | <a href="general-index.php?tablename=computer">Computer</a>
  | <a href="general-index.php?tablename=ext_device">Ext_Device</a>
  | <a href="general-index.php?tablename=software">Software</a>
  | <a href="general-index.php?tablename=customer">Customer</a>
  | <a href="general-index.php?tablename=odin">ODIN</a>
  | <a href="knowledgebase-index.php">Knowledge Base</a>
  | <a href="faq-index.php">FAQ</a> 
  | <a href="https://dactyl.arc.nasa.gov/wiki/index.php">WiKi</a> 
  | <a href="surplus-index.php">Surplus</a>
  | <a href="setup-index.php">Setup</a>
  | <a href="passwd.php">Change PW</a>
  | <a href="logout.php">
      Logout <font color='darkgreen'>
      USER NAME</font>
      from <font color='red'>DB NAME</font> database</a>
<td align=\"right\"><?php echo date("M d H:i"); ?></td>
</tr>
</table>
<hr noshade>
<?php echo $content; ?>
</body>
</html>
