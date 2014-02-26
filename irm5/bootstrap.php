<?php

error_reporting(E_ALL);

require_once 'config/config.php';

/* ============================================
 * Doubles as a check to see what classes are being called
 */
function irm_autoloader($class) 
{
    switch($class)
    {
        case 'DBI':
            include __DIR__ . '/include/DBI/DBI.php';
            return;
        case 'User':
            include __DIR__ . '/include/User.php';
            return;
    }
}
spl_autoload_register('irm_autoloader');

session_start();

/* ==============================================
 * Pretty sure we will want an app class
 */
class App
{
    protected $config;
    
    protected $dbh;
    protected $user;
    
    public function __construct($config)
    {
        $this->config = $config;
    }
    public function render($name,$params = array())
    {
        // Some defaults
        if (!isset($params['cfg_expires'])) $params['cfg_sendexpire'] = 1;
        
        extract($params);
        ob_start();
        include 'views/' . $name;
        return ob_get_clean();
    }
    public function getDbh()
    {
        if ($this->dbh) return $this->dbh;
        
        $this->dbh = new DBI($this->config['database']);
        
        return $this->dbh;
    }
    public function getUser()
    {
        if ($this->user) return $this->user;
        
        $userName = isset($_SESSION['IRMName']) ? $_SESSION['IRMName'] : null;
        if (!$userName) die('app.loadUser no name');
        
        $dbh = $this->getDbh();
        
        $this->user = new User($dbh,$userName);
        
        return $this->user;
        
    }
    // Pretend I am an event listener
    public function authCheck($authType)
    {
        // Check for expired cookies
        if (!isset($_SESSION['IRMName']))
        {
            die('no name');
        }
        $user = $this->getUser();
        
        $userType = $user->getAccess();
        
        $error = null;
        
        switch($authType)
        {
            case 'normal':
                if (in_array($userType,array('normal','tech','admin'))) return;
                $error = 'You are not a Normal User!';
                break;
                
            case 'tech':
                if (in_array($userType,array('tech','admin'))) return;
                $error = 'You are not a Tech User!';
                break;
                        
            case 'admin':
                if ($userType == 'admin') return;
                $error = 'You are not an Admin User!';
                break;
                      
            default:
                return;
        }
        die('auth falied ' . $error);
    }
}
$GLOBALS['app'] = new App($GLOBALS['config']);
