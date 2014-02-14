<?php

class PageHistory
{
    protected $history = array();
    
    public function add($page)
    {
        array_unshift($this->history, $page);
        
        // Keep the size of this thing under control
        if (count($this->history) > 10)
        {
            $this->history = array_slice($this->history, 0, 10);
        }
    }
    
    public function rollback()
    {
        array_shift($this->history);
    }

    public function current()
    {
        return $this->history[0];
    }

    public function previous()
    {
        return $this->history[1];
    }
}
