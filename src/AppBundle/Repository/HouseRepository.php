<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\QueryBuilder;

class HouseRepository extends EntityRepository
{
  public function getAllNames()
  {
    $queryBuilder = $this->createQueryBuilder('h');

    $queryBuilder->select('h.name');

    return $queryBuilder
    ->getQuery()
    ->getArrayResult()
    ;
  }

  public function getAllInformations()
  {
    $queryBuilder = $this->createQueryBuilder('h');

    $queryBuilder->select('h.id', 'h.name', 'h.points');

    return $queryBuilder->getQuery()->getArrayResult();
  }
}
 ?>
