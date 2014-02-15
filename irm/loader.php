<?php

/* ======================================================
 * Quick way to load up the database
 */
require_once dirname(__FILE__) . '/include/irm.inc';
require_once dirname(__FILE__) . '/lib/Config.php';
require_once dirname(__FILE__) . '/lib/Databases.php';
require_once dirname(__FILE__) . '/lib/IRMDB.php';

class DatabaseLoader
{
    public function load($dbName)
    {
        $dbcfg = Config::CurrentSection('database', $dbName);
        $dbh = new IRMDB($dbcfg['DSN']);
        
        $dbh->exec5('drop   database ' . $dbName);
        $dbh->exec5('create database ' . $dbName);
        $dbh->exec5('use '             . $dbName);
        
        require_once 'database/install.php';
        
        echo sprintf("Count %d %d\n",count($INSTALL),count($SAMPLEDATA));
        
        foreach($INSTALL as $sql)
        {
            $dbh->exec5($sql);
        }
        foreach($SAMPLEDATA as $sql)
        {
            $dbh->exec5($sql);
        }
    }
}
$loader = new DatabaseLoader();
$loader->load('irm');
