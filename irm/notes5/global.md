Replace tabs with 4 spaces.  Use [\t] as a regular expression.  
This replacement is the only thing that should be done to files under irm-1.6-b3.

Follow the example in config/database.ini for dsn.  
Hacking in user name and password for now.
PDO supports sockets in the dsn.

Add static to all static class functions.

Remove depreciated =& as they get found.

Replace @ error suppression with proper checks.

Replace most error stuff by just tossing an exception.

Use ***5 for most comments

For now at least, used prepared sql statements.

For IRMDB, add '5' to the name of all methods that use pdo.

Moving some names to camelCase with lower first letter.  
But not being super consistent.

Use __construct for constructors.

Replace parent:: with self::

ereg_replace is now preg_replace - Have not looked at the differences yet