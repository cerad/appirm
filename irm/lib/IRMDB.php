<?php

require_once 'MDB.php';
require_once dirname(__FILE__) . '/../include/i18n.php';

/* ==============================================
 * ***5 This looks to be a wrapper for MDB.
 *      Replace with PDP
 */
class IRMDB
{
    // The DSN for the currently connected DB.  Should be set only if
    // we are actually connected.
    protected $dsn = NULL;
    
    // The pdo connection object
    protected $conn;
    
    public function __construct($dsn)
    {
        $parts = explode(',',$dsn);
        
        $pdo = new PDO($parts[0],$parts[1],$parts[2]);
        
        $pdo->setAttribute(PDO::ATTR_ERRMODE,PDO::ERRMODE_EXCEPTION);
        $pdo->setAttribute(PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC);
        
        $this->dsn  = $dsn;
        $this->conn = $pdo;
    }
    public function isConnected() { return $this->conn ? true : false; }
    public function getDSN()      { return $this->dsn; }
    
    /** Decease if the database is suffering from an error.
     */
    function DieOnError($noisy = false)
    {
        if ($this->error)
        {
            $msg = $this->error->GetMessage()."\n"
                .$this->error->GetUserInfo();

            // Mask DSN password, for safety's sake
            $msg = preg_replace('%mysql://([^:]*):[^@]*@%', 'mysql://\\1:xxx@', $msg);
                
            if ($noisy)
            {
                echo $msg;
            }
            
            trigger_error($msg, E_USER_ERROR);
            
            exit;
        }
    }
    
    /** Create an insert query and run it on the database.
     * Similar in concept to the autoExecute method in PEAR::DB --
     * take an assoc. array of field => value pairs in $values, and create
     * an INSERT INTO $table query from that.
     */
    function InsertQuery($table, $values)
    {
        // The list of fields in the insert query
        $fields = array();
        
        // The quoted values ready for insertion
        $quoted = array();
        
        foreach ($values as $f => $v)
        {
            $fields[] = $f;
            $quoted[] = $this->_dbh->getTextValue($v);
        }
        
        $fields = join(',', $fields);
        $quoted = join(',', $quoted);
        
        $q = "INSERT INTO $table ($fields) VALUES ($quoted)";
        
        $this->query($q);
    }
    
    /** Create an update query and run it on the database.
     * Similar in concept to the autoExecute method in PEAR::DB --
     * take an assoc. array of field => value pairs in $values, and create
     * an UPDATE $table query from that.
     * Any criteria to select which records to update should be specified
     * in $where.
     */
    function UpdateQuery($table, $values, $where = NULL)
    {
        // The list of fields in the query
        $fields = array();
        
        foreach ($values as $key => $value)
        {
            $fields[] = "$key=".$this->_dbh->getTextValue($value);
        }
        
        $fields = join(',', $fields);
        
        if ($where !== NULL)
        {
            $where = "WHERE $where";
        }

        $query = "UPDATE $table SET $fields $where";
    
        $this->query($query);
    }
    
    function nextId()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'nextId'), $args);
    }
    
    function query5($sql,$params = null)
    {
        $stmt = $this->conn->prepare($sql);
        $stmt->execute($params);
        return $stmt->fetchAll();
    }
    function exec5($sql)
    {
        echo substr($sql,0,30) . "\n";
        return $this->conn->exec($sql);
    }
    // This is avtually supposed to return one column
    function getOne5($sql,$params)
    {
        $stmt = $this->conn->prepare($sql);
        $stmt->execute($params);
        
        $val = $stmt->fetchColumn();
        
        // PDO return false on no more rows
        // IRM appears to check for null
        return $val === FALSE ? NULL : $val;
    }
    
    function getRow()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'getRow'), $args);
    }
    
    function getCol()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'getCol'), $args);
    }
    
    function getAll()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'getAll'), $args);
    }
    
    function getTextValue5($value)
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'getTextValue'), $args);
    }
    
    function setErrorHandling()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'setErrorHandling'), $args);
    }

    function pushErrorHandling()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'pushErrorHandling'), $args);
    }

    function popErrorHandling()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'popErrorHandling'), $args);
    }

    function autoCommit()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'autoCommit'), $args);
    }
    
    public function beginTransaction5() { return $this->conn->beginTransaction(); }
    public function commit5()           { return $this->conn->commit(); }
    public function rollback5()         { return $this->conn->rollback(); }

    function disconnect()
    {
        $args = func_get_args();
        return call_user_func_array(array(&$this->_dbh, 'disconnect'), $args);
        
        $this->_dbh = NULL;
    }

    /* Testing only: remove all tables from the database
     * Not something you want to try at home, kids.
     *
     * This method has a kink -- since a table may fail to drop
     * because of key constraints, we need to keep dropping tables over
     * and over until they're all gone or we can't drop any more.  This
     * problem makes this method about an order of magnitude more complex
     * than it otherwise would need to be.
     */
    function _EmptyDatabase()
    {
        $tbls = $this->_dbh->getCol('SHOW TABLES');

        $continue = true;
        $this->pushErrorHandling(PEAR_ERROR_RETURN);
        while ($continue)
        {
            $continue = false;
            $faileds = array();
            
            foreach ($tbls as $t)
            {
                $err = $this->_dbh->query("DROP TABLE $t");
                if (MDB::isError($err))
                {
                    $faileds[] = $t;
                }
                else
                {
                    $continue = true;
                }
            }
            
            $tbls = $faileds;
        }

        $this->popErrorHandling();

        if (count($tbls))
        {
            // Didn't drop all tables
            trigger_error("Failed to drop the following tables: ".join(' ', $tbls), E_USER_ERROR);
        }
    }

    /** Run an array of pre-specified queries
     * Churn through a pile of queries given in $querylist.
     *
     * Special feature: if an entry in $queryset is an array, it will be
     * considered to be an associative array of dbtype => query entries.
     * We will run the query corresponding to the dbtype of the database
     * if possible, or otherwise an entry with the special dbtype of
     * '_default', if available.
     *
     * Returns an array of failed queries, if such a thing is desired.
     * An empty array returned means "All good".
     */
    function BulkQueries($queryset)
    {
        $errorlist = array();
        foreach ($queryset as $q)
        {
            if (is_array($q))
            {
                foreach ($q as $dbtype => $qry)
                {
                    if (ereg("^$dbtype://", $this->dsn))
                    {
                        $q = $qry;
                        break;
                    }
                }
                
                $q = $q['_default'];
                if (!$q)
                {
                    continue;
                }
            }
            
            $err = $this->query($q);
            if (MDB::isError($err))
            {
                $errorlist[] = $err->getMessage().$err->getUserInfo();
            }
        }

        return $errorlist;
    }
    
    /** Initialise a (presumably) empty database
     */
    function InitDatabase()
    {
        global $INSTALL;
        require_once dirname(__FILE__) . '/../database/install.php';
        $this->BulkQueries($INSTALL);
    }

    /** Attempt to determine the version of the currently connected database.
     * Returns the version (as a string) of the database if we can work it
     * out, or false if it doesn't appear to be an IRM database.
     */
    function GetDatabaseVersion()
    {
        $this->_dbh->pushErrorHandling(PEAR_ERROR_RETURN);
        // 1.5.2+
        $curver = $this->_dbh->getOne("SELECT value FROM config WHERE variable='dbver'");
        if (MDB::isError($curver))
        {
            // Covers most versions
            $curver = $this->_dbh->getOne("SELECT version FROM config");
            if (MDB::isError($curver) && $curver->getCode() == MDB_ERROR_NOSUCHTABLE)
            {
                // Pre 1.3.1
                $curver = $this->_dbh->getOne("SELECT number FROM version");
            }
        }

        if (MDB::isError($curver))
        {
            return false;
        }
        else
        {
            return $curver;
        }
    }
}

function DBDie($err)
{
    // Bugger it, people need to know about this all the time
    if (substr_count($err->getUserinfo(), 'nativecode=1044') > 0)
    {
        __("Permission denied: you have not granted the necessary database privileges to your database user.");
        exit;
    }

    if (substr_count($err->getUserinfo(), 'nativecode=1049') > 0)
    {
        __("Error : There seems to be a problem connecting to your database : Error code 1049");
        exit;
    }

    $msg = sprintf(_("Database Error: %s (%s)"),$err->getMessage(),$err->getUserInfo());
    
    trigger_error($msg, E_USER_ERROR);
}
