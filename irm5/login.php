<?php

require_once 'bootstrap.php';

include_once("./include/irm_conf.php");
//include_once("./include/class.user");
include_once("./include/func.header_footer");

$userName = $_SESSION['IRMName'];
$userPass = $_SESSION['IRMPass'];

if ($userPass == 'daedalus-ts')
{
    exit(header("Location: users/passwd.php"));
}
$user = new User($userName);

$user->authenticate($userName,$userPass);

if (isset($_REQUEST['f_req']) && $_REQUEST['f_req'] = 'yes')
{
    exit(header("Location: users/faq-index.php"));
}

// Redirect with a few session variables set
header("Location: users/");

?>
