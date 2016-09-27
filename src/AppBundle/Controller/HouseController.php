<?php

namespace AppBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class HouseController extends Controller
{
  public function indexAction()
  {
      $doc = $this->get('Doctrine');

      $teamsInformations  = $doc->getRepository('AppBundle:House')->getAllInformations();
      $teamsMembersCount = $doc->getRepository('UserBundle:User')->getCountMembersGroupedByTeams();

      return $this->render('index.html.twig', array(
        "teams" => $teamsInformations,
        "teamsMembers" => $teamsMembersCount
      ));
  }

  public function listTeamAction($teamName)
  {
    $doc = $this->get('Doctrine');

    $house = $doc->getRepository('AppBundle:House')->findByName($teamName);
    $teamId = $house[0]->getId();

    $membersList = $doc->getRepository('UserBundle:User')->findByTeamId($teamId);

    return $this->render('houses_members.html.twig', array(
      "members" => $membersList,
      "houseName" => $teamName
    ));
  }

}


 ?>
