<?php

namespace Cerad\Bundle\AppBundle\Action\Faq\Show;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class FaqShowController extends Controller
{
    public function action(Request $request, $_faq)
    {
        $articleRepo = $this->container->get('cerad_app__kbarticle_repository');
        
        $article = $articleRepo->find($_faq);
       
        
        $tplData = array();
        $tplData['title'] = $request->attributes->get('_title');
        $tplData['article'] = $article;
        
        return $this->render('@CeradApp/Faq/Show/FaqShowPage.html.twig',$tplData);
    }
}
