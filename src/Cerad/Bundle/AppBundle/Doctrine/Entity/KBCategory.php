<?php

namespace Cerad\Bundle\AppBundle\Doctrine\Entity;

use Doctrine\Common\Collections\ArrayCollection;

class KBCategory
{
    protected $id;
    protected $name;
    protected $parent;
    
    protected $articles;
    protected $children;
    
    public function __construct()
    {
       $this->articles = new ArrayCollection();
       $this->children = new ArrayCollection();die('construct');
    }
    public function getName()     { return $this->name;     }
    public function getChildren() { return $this->children; }
    public function getArticles() { return $this->articles; }
    
    public function getFaqArticles()
    {
        $articles = array();
        foreach($this->articles as $article)
        {
            if ($article->isFaq()) $articles[] = $article;
        }
        return $articles;
    }
    
}

