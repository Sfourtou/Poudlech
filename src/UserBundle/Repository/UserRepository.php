<?php

namespace UserBundle\Repository;

use Doctrine\ORM\EntityRepository;

class UserRepository extends EntityRepository
{
  public function getCountMembersGroupedByTeams()
  {
    $qb = $this->createQueryBuilder('u');

    $qb->select('IDENTITY(u.teamId) as teamId', 'count(u.id) as total')
    ->where('u.teamId is not null')
    ->groupBy('u.teamId')
    ;

    $results = $qb->getQuery()->getResult();

    $return_results = array();
    foreach ($results as $result){
      $return_results[intval($result["teamId"])] = intval($result["total"]);
    }

    return $return_results;
  }

  public function findNames()
  {
    $qb = $this->createQueryBuilder('u');
    $qb->select('u.firstName, u.name')
    ;

    return $qb->getQuery()->getArrayResult();
  }
}

?>
