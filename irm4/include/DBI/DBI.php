<?php

class DBIStatement extends \PDOStatement
{
    public function fetchrow_hash()
    {
        $rows = $this->fetchAll();
        return (count($rows) == 1) ? new DBIDataRow($rows[0]) : new DBIDataRow(array());
    }
    public function fetchrow_array()
    {
        $rows = $this->fetchAll(\PDO::FETCH_NUM);
        return (count($rows) == 1) ? $rows[0] : array();
    }
    public function finish() { }
}
class DBI
{
    public $dbh;
    
    public function __construct($type, $host, $name, $user, $pass)
    {   
        $dsn = sprintf('%s:host=%s;dbname=%s',$type,$host,$name);
        $this->dbh = new \PDO($dsn,$user,$pass,array(
            \PDO::ATTR_ERRMODE,           PDO::ERRMODE_EXCEPTION,
            \PDO::ATTR_DEFAULT_FETCH_MODE,PDO::FETCH_ASSOC,
        ));
        $this->dbh->setAttribute(\PDO::ATTR_STATEMENT_CLASS,array('DBIStatement'));
    }
    public function prepare($sql)
    {
        return $this->dbh->prepare($sql);
    }
}
class DBIDataRow implements \ArrayAccess,\Countable
{
    protected $container;
    
    public function __construct(Array $data) { $this->container = $data; }
    
    public function __get($offset)
    {
        return isset($this->container[$offset]) ? $this->container[$offset] : null;
    }
    public function __set($offset,$value)
    {
        $this->container[$offset] = $value;
        return $this;
    }
    public function offsetSet($offset, $value) 
    {    
        $this->container[$offset] = $value;
        return $this;
    }
    public function offsetExists($offset) 
    {
        return isset($this->container[$offset]);
    }
    public function offsetUnset($offset) 
    {
        unset($this->container[$offset]);
    }
    public function offsetGet($offset) 
    {
        return isset($this->container[$offset]) ? $this->container[$offset] : null;
    }
    public function count() 
    { 
        return count($this->container); 
    }
}

?>
