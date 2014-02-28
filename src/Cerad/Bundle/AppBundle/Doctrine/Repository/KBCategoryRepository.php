<?php

namespace Cerad\Bundle\AppBundle\Doctrine\Repository;

class KBCategoryRepository extends AbstractRepository
{
    public function findRoot()
    {
        return $this->findOneBy(array('name' => 'IRM'));
    }
}

