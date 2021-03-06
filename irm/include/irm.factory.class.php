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
// get savant
require_once(dirname(__FILE__) . '/../lib/Savant2.php'); // basepath

class IrmFactory extends Savant2
{
    
    public function __construct()
    {
        self::Savant2(array(
            'template_path'=>dirname(__FILE__) . '/../templates/',
            'resource_path'=>dirname(__FILE__) . '/../lib/Savant2/')
        );
    }

    function getConfiguration()
    {
    }
}

?>
