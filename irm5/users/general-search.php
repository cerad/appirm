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
include_once("../include/func.surplus_header");

include_once("../include/func.asset_info");
include_once("../include/func.search");

initvar('limit','page');

// Required Inputs: 
// $tablename - name of table in batabase

// $logical[] - Logical Test (AND/OR)
// $value[]   - Search Value
// $test[]    - Test type (LIKE/NOT LIKE)
// $match[]   - Exact or Wild Card Search
// $field[]   - Table Field to Search On

// $sort      - table field to sort on

// Optional Inputs: 
// $display - list of columns to dispay
// $page    - Page number for pager
// $limit   - Number of records to display per page

// Do Authorization
AuthCheck("normal");


// Config: Database lookup using 'tablename'
$info_hash = getAssetInfo($tablename);

// Auto Set Variable Names Based on Column Names
extract($info_hash);

$sort || $sort = $sort_default;

// Create Page title
$name = ucfirst($tablename);
$normal = strpos($tablename, 'surplus');

if ( $normal === false ) { 
   commonHeader("Daedalus $name - Search Results");
} else {
   commonSurplusHeader("Daedalus $name - Search Results");
}         

echo "<p><a href=\"general-index.php?$QUERY_STRING\">Restart Search</a>";
echo " | <a href=\"general-csv.php?$QUERY_STRING\">Display CSV</a>";
echo " | <a href=\"general-csv.php?dump=1&$QUERY_STRING\">Download CSV</a></p>";

// Call Function to Create Paged Information HTML Table
$return = SearchView($tablename, $logical, $value, $test, $match, $field,
           $sort, $col1, $col2, $display, $page, $limit);


commonFooter();

if ( $return ) {
 $query = $QUERY_STRING . "&fail=yes";
 header("Location: https://$SERVER_NAME/irm/users/general-index.php?$query");
};

ob_flush();

?>
