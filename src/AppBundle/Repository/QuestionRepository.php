<?php

namespace AppBundle\Repository;

use Doctrine\ORM\EntityRepository;
use Doctrine\ORM\QueryBuilder;

class QuestionRepository extends EntityRepository
{

 public function findActualQuestions()
 {
  $queryBuilder = $this->createQueryBuilder('q');

  $queryBuilder->select('q')
      ->where('q.endDate < :date')
      ->setParameter('date', new \DateTime())
  ;

  return $queryBuilder->getQuery()->execute();
 }
}
 ?>
