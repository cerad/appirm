<?php

class User
{
    protected $dbh;
    
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

    function User($dbh,$name)
    {
        $this->dbh = $dbh;
        
        if (!$name) throw new \Exception('User __construct with no user name');
        
        $this->setName($name);
        $this->retrieve();
    }
    
    function authenticate($namex, $passx) 
    {
        // ***5 Not really needed?
        $name = $this->getName();
        $pass = $this->getPassword();
        
        if (($name != $namex) || ($pass != md5($passx)))
        {
            throw new \Exception('User authentication failed');
        }
        return true;       
     }

    function retrieve()
    {
        $sql1 = <<<EOT
SELECT password,fullname,email,building,phone,access,comments 
FROM users 
WHERE (name = :name);
EOT;
        $name = $this->udata['Name'];
        $result1 = $this->dbh->fetchRow($sql1,array('name' => $name));
        if (!$result1) throw new Exception('User Not Found: ' . $name);
        
        $this->udata["Password"] = $result1["password"];
        $this->udata["Fullname"] = $result1["fullname"];
        $this->udata["Email"]    = $result1["email"];
        $this->udata["Location"] = $result1["building"];
        $this->udata["Phone"]    = $result1["phone"];
        $this->udata["Access"]   = $result1["access"];
        $this->udata["Comments"] = $result1["comments"];

        $sql2 = "SELECT * FROM prefs WHERE (user = :name)";
        $result2 = $this->dbh->fetchRow($sql2,array('name' => $this->udata['Name']));
        if($result2)
        {
            $this->setDisplayComputerType          ($result2["type"]);
            $this->setDisplayOperatingSystem       ($result2["os"]);
            $this->setDisplayOperatingSystemVersion($result2["osver"]);
            $this->setDisplayProcessor             ($result2["processor"]);
            $this->setDisplayProcessorSpeed        ($result2["processor_speed"]);
            $this->setDisplayLocation              ($result2["building"]);
            $this->setDisplaySerial                ($result2["serial"]);
            $this->setDisplayOtherSerial           ($result2["otherserial"]);
            $this->setDisplayRamType               ($result2["ramtype"]);
            $this->setDisplayRam                   ($result2["ram"]);
            $this->setDisplayNetwork               ($result2["network"]);
            $this->setDisplayIP                    ($result2["ip"]);
            $this->setDisplayMachineAddress        ($result2["mac"]);
            $this->setDisplayHardDriveSize         ($result2["hdspace"]);
            $this->setDisplayContact               ($result2["owner"]);
            $this->setDisplayContactNumber         ($result2["room"]);
            $this->setDisplayComments              ($result2["comments"]);
            $this->setDisplayDateMod               ($result2["date_mod"]);
            $this->setAdvancedTracking             ($result2["advanced_tracking"]);
            $this->setTrackingOrder                ($result2["tracking_order"]);
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

