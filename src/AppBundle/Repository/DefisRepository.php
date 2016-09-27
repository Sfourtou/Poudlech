<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;

class DefisRepository extends EntityRepository
{
 public function findActualDefis() {

     $queryBuilder = $this->createQueryBuilder('d');

     $queryBuilder->select('d')
         ->where('d.endDate > :date')
         ->setParameter('date', new \DateTime())
         ;

     return $queryBuilder->getQuery()->execute();
 }
}

 ?>
