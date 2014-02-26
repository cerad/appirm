<?php
require_once '../bootstrap.php';

$app = $GLOBALS['app'];

$app->authCheck("post-only");

$params = array(
    'title'    => 'Daedalus Frequently Asked Questions',
    'content'  => $app->render('faq.html.php'),
);
echo $app->render('layout.html.php',$params);
exit();

include_once("../include/irm_conf.php");
include_once("../include/class.user");
include_once("../include/func.header_footer");

include_once("../include/func.knowledgebase");

AuthCheck("post-only");

commonHeader("Daedalus Frequently Asked Questions");
?>
This is the Daedalus FAQ system. It allows you to view the questions most 
frequently asked of the helpdesk.
<br>
<BR>
<table border=0 width=100%>
<tr>
		</h4></td></tr>
</TABLE>
<?php
faqdisplaycategories();
commonFooter();
?>
