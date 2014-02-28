<?php

namespace Cerad\Bundle\AppBundle\Doctrine\Entity;

class KBArticle
{
    protected $id;
    protected $category;
    protected $question;
    protected $answer;
    protected $faq = 'yes';   // enum yes or no
    
    public function getFaq() { return  $this->faq; }
    public function isFaq()  { return ($this->faq == 'yes') ? true : false; }
    
    public function getQuestion() { return $this->question; }
    public function getAnswer()   { return $this->answer; }
}
?>
