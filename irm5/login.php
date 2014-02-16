<?php

$cfg_dbdb = $dbuse;

include_once("./include/irm_conf.php");
include_once("./include/class.user");
include_once("./include/func.header_footer");

$cfg_dbdb = $dbuse;

#error_reporting(16);

// Why are there two "new" calls here?  Is there some issue with creating a 
// User object with an invalid username?  If that's the case, then we should
// be able to solve the problem using the "exists()" method of the user class.
$user = new User();

$user = new User($name);

if($user->authenticate($name, $password))
{
        header("Location: /irm");
 	print "Bad username or password.";
 	logevent(-1, "IRM", 1, "login", "Failed login: $name");
} else
{

#       $password = md5($userPassword);
        $password = $user->getPassword();

        $IRMName = $name;
        $IRMPass = $password;

        if ($IRMPass == 'daedalus-ts') {
           exit(header("Location: users/passwd.php"));
         }

	if ($f_req=='yes')
	{
		header("Location: users/faq-index.php");
		// Can we pull this out yet?!?!  I guess we need to modify the update
		// script to search through all users and set up these prefs before we
		// do.
		$user->initPrefs();
	} else 
	{
		header("Location: users/");
		// Can we pull this out yet?!?!  I guess we need to modify the update
		// script to search through all users and set up these prefs before we
		// do.
		$user->initPrefs();
	}
}
?>
