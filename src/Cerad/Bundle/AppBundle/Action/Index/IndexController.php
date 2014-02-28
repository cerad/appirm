<?php

namespace Cerad\Bundle\AppBundle\Action\Index;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class IndexController extends Controller
{
    public function action($name = 'Ben')
    {
        return $this->render('@CeradApp/Index/IndexPage.html.twig', array('name' => $name));
    }
}
