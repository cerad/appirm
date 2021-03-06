<?php

// ***5 Just to save all the ldap specific stuff

class UserLdap
{

    var $driver; # the user driver - not used, didn't work, thrown away, see XIRM :)
    var $udata; # user data

    # Preferences Variables
    var $DisplayComputerType;
    var $DisplayOperatingSystem;
    var $DisplayOperatingSystemVersion;
    var $DisplayProcessor;
    var $DisplayProcessorSpeed;
    var $DisplayLocation;
    var $DisplaySerial;
    var $DisplayOtherSerial;
    var $DisplayRamType;
    var $DisplayRam;
    var $DisplayNetwork;
    var $DisplayIP;
    var $DisplayMachineAddress;
    var $DisplayHardDriveSize;
    var $DisplayContact;
    var $DisplayContactNumber;
    var $DisplayComments;
    var $DisplayDateMod;
    var $AdvancedTracking;
    var $TrackingOrder;

# maybe move the above to a hash?

    function User($name = "")
    {
        die('User ' . $name);
        if($name != "")
        {
            $this->setName($name);
            $this->retrieve();
        }
    }
    
    function authenticate($u, $p) 
    {
        global $adb, $AUTHSOURCE, $cfg_ldapserver, $cfg_serverroot, $cfg_ldapserver;

        # TODO: MD5 Password hashes, encryption

        if($AUTHSOURCE == "DB")
        {
            $q = $adb->prepare("SELECT name FROM users WHERE name = '$u' AND password = '$p'");
            $q->execute();
            $r = $q->fetchrow_hash();

//                        print"User: $r[name]  PW: $r[password] <BR />";

            if ($r[name] == $u) 
            {
                return(0);
            } else 
            {
                return(1); # error!
            }
    
            #return $this->driver->authenticate($name, $password);
        } else if ($AUTHSOURCE == "LDAP")
        {
            if(!($u) || !($p))
            {
                PRINT "Sorry, you must enter a username and a password.<BR>\n";
                return(1);
            }

            // Generate a DN from a uid
            $dn = "uid=$u, " . $cfg_serverroot;

            // Connect to ldap server
            $dsCon = ldap_connect($cfg_ldapserver);

            // Make sure we connected
            if (!($dsCon))
            {
                PRINT "Sorry, cannot contact LDAP server\n";
                return(1);
            }
            
            // Attempt to bind, if it works, the password is acceptable
            $bind = ldap_bind($dsCon, $dn, $p);

            if(!($bind))
            {
                PRINT "Sorry, your username/password were not accepted.<BR>\n";
                PRINT "Hit the \"back\" button on your browser, and try again.<BR>\n";
                return(1);
            }

            // If we got here, the username/password worked.


            ldap_close($dsCon);

            // If LDAP user does not exist in mysql database, create it.
            $this->ldapAddUser($u);
            return (0);
        } else
        {
            PRINT "Error: No proper authorization source entered in config.inc.php";
        }
    }

    function ldapAddUser($u)
    {
        global $cfg_ldapfullname, $cfg_ldapemail, $cfg_ldapserver, $cfg_serverroot, $cfg_ldaplocation, $cfg_ldapphone;
        if(!($this->exists($u)))
        {
            // Before this will work, we need to have the Full Name.
            // We should also need to set the email address in most cases.

            // Generate a DN from a uid
            $dn = "uid=$u, $cfg_serverroot";

            // Connect to ldap server
            $dsCon = ldap_connect($cfg_ldapserver);

            // Make sure we connected
            if (!($dsCon))
            {
                PRINT "Sorry, cannot contact LDAP server\n";
                exit;
            }

            $bind = ldap_bind($dsCon);
            if(!($bind))
            {
                PRINT "Sorry, could not do an anonymous bind to your ldap server.<BR>\n";
                exit;
            }

            $pieces[0] = $cfg_ldapemail;
            $pieces[1] = $cfg_ldapfullname;
            $pieces[2] = $cfg_ldapphone;
            $pieces[3] = $cfg_ldaplocation;
            $searchResult = ldap_search($dsCon, $cfg_serverroot, "uid=".$u, $pieces);
            $info = ldap_get_entries($dsCon, $searchResult);

            $fullname = $info[0][$cfg_ldapfullname][0];
            $email = $info[0][$cfg_ldapemail][0];
            $officephone = $info[0][$cfg_ldapphone][0];
            $officelocation = $info[0][$cfg_ldaplocation][0];
            $this->setEmail($email);
            $this->setFullname($fullname);
            $this->setLocation($officelocation);
            $this->setPhone($officephone);
            $this->setAccess("normal");
            $this->add(true);
        }
    }

    function retrieve()
    {
        global $adb;    

        $query = "SELECT password,fullname,email,building,phone,access,comments FROM users WHERE (name = '".$this->udata["Name"]."')";
        $sth = $adb->prepare($query);
        $res = $sth->execute();
        $result = $sth->fetchrow_hash();

                $this->udata["Password"] = $result["password"];
        $this->udata["Fullname"] = $result["fullname"];
        $this->udata["Email"] = $result["email"];
        $this->udata["Location"] = $result["building"];
        $this->udata["Phone"] = $result["phone"];
        $this->udata["Access"] = $result["access"];
        $this->udata["Comments"] = $result["comments"];

        $query = "SELECT * FROM prefs WHERE (user = ".$this->udata["Name"].")";
        $sth = $adb->prepare($query);
        if($sth)
        {
            $res = $sth->execute();
            $result = $sth->fetchrow_hash();
            $this->setDisplayComputerType($result["type"]);
            $this->setDisplayOperatingSystem($result["os"]);
            $this->setDisplayOperatingSystemVersion($result["osver"]);
            $this->setDisplayProcessor($result["processor"]);
            $this->setDisplayProcessorSpeed($result["processor_speed"]);
            $this->setDisplayLocation($result["building"]);
            $this->setDisplaySerial($result["serial"]);
            $this->setDisplayOtherSerial($result["otherserial"]);
            $this->setDisplayRamType($result["ramtype"]);
            $this->setDisplayRam($result["ram"]);
            $this->setDisplayNetwork($result["network"]);
            $this->setDisplayIP($result["ip"]);
            $this->setDisplayMachineAddress($result["mac"]);
            $this->setDisplayHardDriveSize($result["hdspace"]);
            $this->setDisplayContact($result["owner"]);
            $this->setDisplayContactNumber($result["room"]);
            $this->setDisplayComments($result["comments"]);
            $this->setDisplayDateMod($result["date_mod"]);
            $this->setAdvancedTracking($result["advanced_tracking"]);
            $this->setTrackingOrder($result["tracking_order"]);
        } else
        {
            PRINT "Could not prepare query: ".$sth->errstr."<BR>\n";
        }
    }

    function add($isLDAP = false)
    {
        global $adb;
        if($this->udata[Name] == "")
        {
            PRINT "Error adding user: username not set<BR>\n";
        }
        if($this->udata[Password] == "" && ($isLDAP == false))
        {
            PRINT "Error adding user: password not set<BR>\n";
        }
        if($this->udata[Fullname] == "")
        {
            PRINT "Error adding user: password not set<BR>\n";
        }
        if($this->udata[Access] == "")
        {
            PRINT "Error adding user: type not set<BR>\n";
        }

        $query = "INSERT INTO users VALUES ('".$this->udata[Name]."', '".$this->udata[Password]."', '".$this->udata[Fullname]."', '".$this->udata[Email]."', '".$this->udata[Location]."', '".$this->udata[Phone]."', '".$this->udata[Access]."', '".$this->udata[Comments]."')";
        $adb->dbh_do($query);
        $this->initPrefs();
    }

    function initPrefs()
    {
        global $adb;
        $query = "SELECT * FROM prefs WHERE (user = '".$this->udata[Name]."')";
        $sth = $adb->prepare($query);
        if($sth)
        {
            $res = $sth->execute();
            $numRows = $sth->rows();
            if ($numRows == 0)
            {
                $query = "INSERT INTO prefs VALUES ('".$this->udata[Name]."', 'yes',";
                $query = $query." 'no','no', 'no', no', 'no', 'no', 'no', 'no', 'no',";
                $query = $query." 'no', 'no', no', 'no', 'no', 'no', 'no', 'no',";
                $query = $query." 'yes', 'no')"; 
                $adb->dbh_do($query);
            }
        } else
        {
            PRINT "Could not prepare query: ".$sth->errstr."<BR>\n";
        }
    }

    function delete()
    {
        global $adb;
        if($this->udata[Name] == "")
        {
            PRINT "Error deleting user: name not set<BR>\n";
        }

        $query = "DELETE FROM users WHERE (name = \"".$this->udata[Name]."\")";
        $adb->dbh_do($query);

        $query = "DELETE FROM prefs WHERE (user = \"".$this->udata[Name]."\")";
    }

    function commit()
    {
        global $adb;
        if($this->udata[Name] == "")
        {
            PRINT "Error updating user: name not set<BR>\n";
            return (0);
        }
        $query = "REPLACE users VALUES('".$this->udata[Name]."', '".$this->udata[Password]."', '".$this->udata[Fullname]."', '".$this->udata[Email]."', '".$this->udata[Location]."', '".$this->udata[Phone]."','".$this->udata[Access]."', '".$this->udata[Comments]."')";
        $adb->dbh_do($query);

        $query = "REPLACE prefs VALUES('".$this->udata[Name]."', '$this->DisplayComputerType',
            '$this->DisplayOperatingSystem', '$this->DisplayOperatingSystemVersion',
            '$this->DisplayProcessor', '$this->DisplayProcessorSpeed',
            '$this->DisplayLocation', '$this->DisplaySerial',
            '$this->DisplayOtherSerial', '$this->DisplayRamType',
            '$this->Ram', '$this->DisplayNetwork', '$this->DisplayIP',
            '$this->DisplayMachineAddress', '$this->DisplayHardDriveSize',
            '$this->DisplayContact', '$this->DisplayContactNumber',
            '$this->DisplayComments', '$this->DisplayDateMod', 
            '$this->AdvancedTracking', '$this->TrackingOrder')";
        $adb->dbh_do($query);
    }

    function getName()
    {
        return($this->udata["Name"]);
    }

    function getPassword()
    {
        return($this->udata["Password"]);
    }

    function getFullname()
    {
        return($this->udata["Fullname"]);
    }

    function getEmail()
    {

        return($this->udata["Email"]);
    }

    function getLocation()
    {
        return($this->udata["Location"]);
    }

    function getPhone()
    {
        return($this->udata["Phone"]);
    }

    function getAccess()
    {
        #print "Access: -".$this->udata["Access"]."-";
        return($this->udata["Access"]);
    }

    function getComments()
    {
        return($this->udata["Comments"]);
    }

    function setName($name)
    {
        $this->udata["Name"] = $name;
    }

    function setPassword($pass)
    {    
        $this->udata["Password"] = $pass;
    }

    function setFullname($fname)
    {
        $this->udata["Fullname"] = $fname;
    }

    function setEmail($email)
    {
        $this->udata["Email"] = $email;
    }

    function setLocation($loc)
    {
        $this->udata["Location"] = $loc;
    }

    function setPhone($phone)
    {
        $this->udata["Phone"] = $phone;
    }

    function setAccess($type)
    {
        $this->udata["Access"] = $type;
    }

    function setComments($comment)
    {
        $this->udata["Comments"] = $comment;
    }

    function displayHeader()
    {
        PRINT "<TABLE WIDTH=\"100%\" BORDER=1 NOSHADE>\n";
        PRINT "<TR><TH><STRONG>Users</STRONG></TH></TR>\n";
    }

    function displayFooter()
    {
        PRINT "</TABLE>\n";
    }

    function display()
    {
        global $USERPREFIX;
        PRINT "<TR BGCOLOR=\"#DDDDDD\">\n";
        PRINT "<TD>";
        if($this->udata["Name"] == "")
        {
            PRINT "Error displaying user: Name not set<BR>\n";
        }
        $username_enc = str_replace(" ","%20", $this->udata["Name"]);
        PRINT $this->udata['Name']." (".$this->udata['Fullname'].")";
        PRINT " <A HREF=\"$USERPREFIX/setup-user-update.php?username=$username_enc&update=edit\">";
        PRINT "[edit]</A>";
                PRINT "<A HREF=\"$USERPREFIX/setup-user-update.php?update=delete&username=$username_enc\">";
               PRINT " [delete]</A>";
               PRINT "<A HREF=\"$USERPREFIX/reset-password.php?username=$username_enc\">";
               PRINT " [reset-pw]</A>";
               PRINT "</TD>\n";
               PRINT "</TR>\n";
    }

    function displayLong()
    {
        $uExists = $this->exists($this->udata[Name]);
        if(!$uExists)
        {
            PRINT "User \"".$this->udata[Name]."\" is no longer a registered user on this system<BR>\n";
            return(0);
        }
        PRINT "<table width=100% border=1 noshade bordercolor=#000000>\n";
        PRINT "<tr bgcolor=#CCCCCC><td colspan=2><strong>".$this->udata[Name]."</strong>\n";
        PRINT "</td></tr>\n";
        PRINT "<tr bgcolor=#DDDDDD><td><font face=\"arial, helvetica\">Name:\n";
        PRINT "<br> ".$this->udata[Fullname]." </font></td><td><font face=\"arial,\n";
        PRINT "helvetica\">&nbsp;</td></tr>";
        PRINT "<tr bgcolor=#DDDDDD><td><font face=\"arial, helvetica\">E-mail:\n";
        PRINT "<br>".$this->udata[Email]." </font></td><td><font face=\"arial, helvetica\">Phone:<br>\n";
        PRINT "".$this->udata[Phone]." </td></tr>";
        PRINT "<tr bgcolor=#DDDDDD><td><font face=\"arial, helvetica\">Location:\n";
        PRINT "<br> ".$this->udata[Location]."</font></td><td><font face=\"arial,\n";
        PRINT "helvetica\">User Access:<br>\n";
        PRINT "".$this->udata[Access]."</td></tr>";
        PRINT "</table><br>";
    }

    function displayAllUsers()
    {
        global $adb;
        User::displayHeader();
        $query = "SELECT name FROM users ORDER BY name ASC";
        $sth = $adb->prepare($query);
        if($sth)
        {
            $res = $sth->execute();

            while($result = $sth->fetchrow_hash())
            {
                
                $name = $result["name"];

                $user = new User($name);
                $user->display();
            }
        } else
        {
            PRINT "Could not prepare query: ".$sth->errstr."<BR>\n";
        }
        User::displayFooter();
    }

    function exists($name)
    {
        global $adb;
        $query = "SELECT * FROM users WHERE (name='$name')";
        $sth = $adb->prepare($query);
        if($sth)
        {
            $res = $sth->execute();
            $numRows = $sth->rows();
            if($numRows > 0)
            {
                return(TRUE);
            } else
            {
                return(FALSE);
            }
        } else
        {
            PRINT "Could not prepare query: ".$sth->errstr."<BR>\n";
        }
    }

    function permissionCheck($priv)
    {


        if($priv == "admin")
        {
            if($this->udata[Access] == "admin")
            {
                return(TRUE);
            } else
            {
                return(FALSE);
            }
        } else if($priv == "tech")
        {
            if(($this->udata[Access] == "admin") || ($this->udata[Access] == "tech"))
            {

                return(TRUE);

            } else
            {
                return(FALSE);
            }
        } else if($priv == "normal")
        {
            if(($this->udata[Access] == "admin") || ($this->udata[Access] == "tech") || ($this->udata[Access] == "normal"))
            {
                return(TRUE);
            } else
            {
                return(FALSE);
            }
        } else if($priv == "post-only")
        {
            if(($this->udata[Access] == "admin") || ($this->udata[Access] == "tech") || ($this->udata[Access] == "normal") || ($this->udata[Access] == "post-only"))
            {
                return(TRUE);
            } else
            {
                return(FALSE);
            }
        } else
        {
            return(FALSE);
        }
    }

    function getDisplayComputerType()
    {
        return($this->DisplayComputerType);
    }

    function setDisplayComputerType($dct)
    {
        $this->DisplayComputerType = $dct;
    }

    function getDisplayOperatingSystem()
    {
        return($this->DisplayOperatingSystem);
    }

    function setDisplayOperatingSystem($dos)
    {
        $this->DisplayOperatingSystem = $dos;
    }

    function getDisplayOperatingSystemVersion()
    {
        return($this->DisplayOperatingSystemVersion);
    }

    function setDisplayOperatingSystemVersion($dosv)
    {
        $this->DisplayOperatingSystemVersion = $dosv;
    }

    function getDisplayProcessor()
    {
        return($this->DisplayProcessor);
    }

    function setDisplayProcessor($dp)
    {
        $this->DisplayProcessor = $dp;
    }

    function getDisplayProcessorSpeed()
    {
        return($this->DisplayProcessorSpeed);
    }

    function setDisplayProcessorSpeed($dps)
    {
        $this->DisplayProcessorSpeed = $dps;
    }

    function getDisplayLocation()
    {
        return($this->DisplayLocation);
    }

    function setDisplayLocation($dl)
    {
        $this->DisplayLocation = $dl;
    }

    function getDisplaySerial()
    {
        return($this->DisplaySerial);
    }

    function setDisplaySerial($ds)
    {
        $this->DisplaySerial = $ds;
    }

    function getDisplayOtherSerial()
    {
        return($this->DisplayOtherSerial);
    }

    function setDisplayOtherSerial($dos)
    {
        $this->DisplayOtherSerial = $dos;
    }

    function getDisplayRamType()
    {
        return($this->DisplayRamType);
    }

    function setDisplayRamType($drt)
    {
        $this->DisplayRamType = $drt;
    }

    function getDisplayRam()
    {
        return($this->DisplayRam);
    }

    function setDisplayRam($dr)
    {
        $this->DisplayRam = $dr;
    }

    function getDisplayNetwork()
    {
        return($this->DisplayNetwork);
    }

    function setDisplayNetwork($dn)
    {
        $this->DisplayNetwork = $dn;
    }

    function getDisplayIP()
    {
        return($this->DisplayIP);
    }

    function setDisplayIP($dip)
    {
        $this->DisplayIP = $dip;
    }

    function getDisplayMachineAddress()
    {
        return($this->DisplayMachineAddress);
    }

    function setDisplayMachineAddress($dma)
    {
        $this->DisplayMachineAddress = $dma;
    }

    function getDisplayHardDriveSize()
    {
        return($this->DisplayHardDriveSize);
    }

    function setDisplayHardDriveSize($hds)
    {
        $this->DisplayHardDriveSize = $hds;
    }

    function getDisplayContact()
    {
        return($this->DisplayContact);
    }

    function setDisplayContact($dc)
    {
        $this->DisplayContact = $dc;
    }

    function getDisplayContactNumber()
    {
        return($this->DisplayContactNumber);
    }

    function setDisplayContactNumber($dcn)
    {
        $this->DisplayContactNumber = $dcn;
    }

    function getDisplayComments()
    {
        return($this->DisplayComments);
    }

    function setDisplayComments($dc)
    {
        $this->DisplayComments = $dc;
    }

    function getDisplayDateMod()
    {
        return($this->DisplayDateMod);
    }

    function setDisplayDateMod($dm)
    {
        $this->DisplayDateMod = $dm;
    }

    function getAdvancedTracking()
    {
        return($this->AdvancedTracking);
    }

    function setAdvancedTracking($at)
    {
        $this->AdvancedTracking = $at;
    }

    function getTrackingOrder()
    {
        return($this->TrackingOrder);
    }

    function setTrackingOrder($to)
    {
        $this->TrackingOrder = $to;
    }

}

