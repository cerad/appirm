<?php
################################################################################
#                                  CHANGELOG                                   #
################################################################################
#  11/2002 - G. hartlieb: Created                                              #
################################################################################

ob_start();

include_once("../include/irm_conf.php");
include_once("../include/class.user");
include_once("../include/func.header_footer");

include_once("../include/func.track-search");

include_once("../include/func.asset_info");

initvar('page','limit');

// Required Inputs: 
// $tablename - name of table in database
// $logical[] - Logical Test (AND/OR)
// $value[]   - Search Value
// $test[]    - Test type (LIKE/NOT LIKE)
// $match[]   - Exact or Wild Card Search
// $field[]   - Table Field to Search On

// $sort      - table field to sort on

// Optinal Inputs: 
// $display - list of columns to dispay
// $page    - Page number for pager
// $limit   - Number of records to display per page

// Do Authorization
AuthCheck("normal");

// Config: Database lookup using 'tablename'
$info_hash = getAssetInfo($tablename);

$sort || $sort = $sort_default;

// Auto Set Variable Names Based on Column Names
extract($info_hash);

// Create Page title
$name = ucfirst($tablename);

commonHeader("Daedalus $name - Search Results");

// Call Function to Create Paged Information HTML Table
$return  = TrackingSearchView($tablename, $logical, $value, $test, $match, $field,
                              $sort, $col1, $col2, $display, $page, $limit);

commonFooter();

if ( $return ) {
 $query = $QUERY_STRING . "&fail=yes";
 header("Location: https://$SERVER_NAME/irm/users/tracking-index.php?$query");
};

ob_flush();

?>
