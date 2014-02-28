<?php
namespace Cerad\Bundle\AppBundle\Command;

use Symfony\Bundle\FrameworkBundle\Command\ContainerAwareCommand;
use Symfony\Component\Console\Input\InputArgument;
use Symfony\Component\Console\Input\InputInterface;
//  Symfony\Component\Console\Input\InputOption;
use Symfony\Component\Console\Output\OutputInterface;

use Cerad\Bundle\AppBundle\Doctrine\Repository\KBCategoryRepository;

class KBCommand extends ContainerAwareCommand
{   
    protected function configure()
    {
        $this->setName       ('app__kb');
        $this->setDescription('Test Repositories');
    }
    protected function getService  ($id)   { return $this->getContainer()->get($id); }
    protected function getParameter($name) { return $this->getContainer()->getParameter($name); }
    
    protected function execute(InputInterface $input, OutputInterface $output)
    {   
        $catRepo = $this->getService('cerad_app__kbcategory_repository');
        
        $root = $catRepo->findRoot();
        echo sprintf("Root %s\n",$root->getName());
        
        $kids = $root->getChildren();
        foreach($kids as $kid)
        {
            $articles = $kid->getFaqArticles();
            if (count($articles))
            {
                echo sprintf("CHILD %s\n",$kid->getName());
                foreach($articles as $article)
                {
                    if ($article->isFaq())
                    {
                        echo sprintf("Q: %s\n",substr($article->getQuestion(),0,40));
                    }
                }
            }
        }
    }
}
?>
