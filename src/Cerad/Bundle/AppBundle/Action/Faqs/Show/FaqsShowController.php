<?php

namespace Cerad\Bundle\AppBundle\Action\Faqs\Show;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class FaqsShowController extends Controller
{
    public function action(Request $request)
    {
        $catRepo = $this->container->get('cerad_app__kbcategory_repository');   
        $root = $catRepo->findRoot();
       
        
        $tplData = array();
        $tplData['title'] = $request->attributes->get('_title');
        $tplData['root'] = $root;
        
        return $this->render('@CeradApp/Faqs/Show/FaqsShowPage.html.twig',$tplData);
    }
}
