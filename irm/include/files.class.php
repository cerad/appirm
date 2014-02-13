<?php 
################################################################################
#    IRM - The Information Resource Manager
#    Copyright (C) 2003 Yann Ramin
#
#    This program is free software; you can redistribute it and/or modify
#    it under the terms of the GNU General Public License as published by
#    the Free Software Foundation; either version 2 of the License, or
#    (at your option) any later version.
#
#    This program is distributed in the hope that it will be useful,
#    but WITHOUT ANY WARRANTY; without even the implied warranty of
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#    GNU General Public License (in file COPYING) for more details.
#
#    You should have received a copy of the GNU General Public License
#    along with this program; if not, write to the Free Software
#    Foundation, Inc., 675 Mass Ave, Cambridge, MA 02139, USA.
#
################################################################################
    /**
     * Class for handling attachment of files to IRM devices
     */

class Files
{
    protected $deviceType = "";
    protected $deviceID = "";
    protected $fileName = "";

    public function __construct()
    {
    }
    public function tableHeader()
    {
        // *** TODO: Herdoc statement
        PRINT "<table>";
        PRINT '<tr>';
        PRINT '<th>';
        PRINT $this->tableName; 
        PRINT "</th>";
        PRINT "</tr>\n";
    }
    public function tableFooter()
    {
        PRINT "</table>";
    }
    function tableData()
    {
        PRINT '<td>';
        PRINT $this->tableDataInfo;
        PRINT '</td>';
    }
    public function setDeviceType($deviceType)
    {
        $this->deviceType = $deviceType;
    }
    function setDeviceID($deviceID)
    {
        $this->deviceID = $deviceID;
    }
    function setFileName($fileName)
    {
        $this->fileName = $fileName;
    }
    function displayAttachedFiles()
    {
        $this->tableName = _("Files Attached");
        $this->tableHeader();
	
        $sql = 'SELECT * FROM files 
                WHERE (deviceid = ' .$this->deviceID . ')
                AND (device = "' . $this->deviceType . '")';
        $DB = Config::Database();
        $files = $DB->getAll($sql);

        foreach($files as $file)
        {
            PRINT '<tr class="devicedetail">';
            $this->tableDataInfo = "<a href=\"files/" . $file['filename']. "\">" . $file['filename'] . "</a>";
            $this->tableData();
            PRINT "</tr>";
	}
		
        $this->tableFooter();	
    }
    // Chopped this out, compile errors
    function displayFileUpload()
    {
        die('displayFileUpload');
    }

    function addRecord()
    {
        $sql = 'INSERT INTO 
                files (filename, device, deviceid) 
                VALUES ("' . $this->fileName . '", "'. $this->deviceType . '", "'. $this->deviceID .'")';
        $DB = Config::Database();
	$DB->query($sql);
    }
    function display()
    {	
        commonHeader(_("File Listing"));

        $sql= 'SELECT * FROM files';
        $DB = Config::Database();
        $dbfiles = $DB->getall($sql);

        $string = '<table class="sortable" id="tracking-files">';

        $string.='<tr>';
        $string.="<th>" . _("ID") . "</th>";
        $string.="<th>" . _("File Name") . "</th>";
        $string.="<th>" . _("Device Type") . "</th>";
        $string.="<th>" . _("Device Name") . "</th>";
        $string.="</tr>";

        /** file listing with match in the database. **/
        foreach($dbfiles as $file) 
        {
            $string.="<tr class=trackingdetail>";
            $string.="<td>{$file['ID']} </td>";
		
            $string.="<td>";
            if (file_exists(dirname(__FILE__) . '/../users/files/' . $file['filename']))
            {	//
                $string.="<a href=\"files/" . $file['filename']. "\">" . $file['filename'] . "</a>";
            } 
            else 
            {	//
                $string.=" {$file['filename']} ";
            }
            $string.="</td>";
            $string.="<td>{$file['device']} </td>";
            $string.="<td>{$file['deviceid']} </td>";
            $string.="</tr>";
	}	
        /** file system listing from users/files directory. **/
        $fsfiles = dir(dirname(__FILE__) . '/../users/files');
        $exclude = array('.', '..');
        while (false !== ($entry = $fsfiles->read())) 
        {
            if (in_array($entry, $exclude)) { continue; }
            
            $match = 0;
            $matchNoFile = 0;
            foreach($dbfiles as $file) 
            {
                if (!strcmp( trim($file['filename']) , trim($entry)) ) 
                {
                    $match = 1;	
                }
            }
            if ($match == 1) { continue; }

            $string.="<tr class=trackingdetail>";
            $string.="<td></td>";
            $string.="<td><a href=\"files/{$entry}\">{$entry}</a></td>";
            $string.="<td>" . _("File exists but is not mapped to a device") . "</td>";
            $string.="<td></td>";
            $string.="</tr>";
        }
        $fsfiles->close();

        $string.="</table>";
        print $string;

        //print "<pre>";	
        //PRINT_R($files);
        //print "</pre>";	

        commonFooter();    
    }
}
?>
