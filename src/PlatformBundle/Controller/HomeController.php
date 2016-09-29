<?php

namespace PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\HttpFoundation\Response;

class HomeController extends Controller
{
  public function indexAction()
  {
      $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'Unable to access this page');
      return $this->render('PlatformBundle::spin.html.twig');
  }

  public function getNameAction(Request $request)
  {
    if (!$request->isXmlHttpRequest())
    {
        return $this->redirectToRoute('houses');
    }


    $doc = $this->get('Doctrine');


      $results = $doc->getRepository('UserBundle:User')->findNames();

      return new Response(json_encode($results));
  }

  public function updatedListAction(Request $request, $name, $school)
  {
      if (!$request->isXmlHttpRequest())
      {
          return $this->redirectToRoute('houses');
      }

      $doc = $this->getDoctrine();

      $user = $doc->getRepository('UserBundle:User')->findByName($name);

      if (isset($user)){

          $schoolEntity = $doc->getRepository('AppBundle:House')->findByName($school);

          if (isset($schoolEntity)){

              $user->setTeamId($schoolEntity);
              $user->setIsTeamLeader(false);

              $doc->getManager()->persist($user);
              $doc->getManager()->flush();
          }
      }

      return true;
  }
}

 ?>
