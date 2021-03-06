<?php
################################################################################
#                                  CHANGELOG                                   #
################################################################################
################################################################################

include_once("../include/irm_conf.php");
include_once("../include/class.user");
include_once("../include/func.header_footer");

include_once("../include/func.knowledgebase");


AuthCheck("post-only");

commonHeader("Daedalus Knowledge Base - Detailed View");
if($addtofaq == "yes")
{
	kbaddtofaq($ID);
} else if($removefromfaq == "yes")
{
	kbremovefromfaq($ID);
}
kbdisplayfullarticle($ID);
kbisfaq($ID);
commonFooter();
?>
