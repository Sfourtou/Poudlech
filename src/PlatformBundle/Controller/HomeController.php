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
//    if (!$request->isXmlHttpRequest())
//    {
//        return $this->redirectToRoute('houses');
//    }


    $doc = $this->get('Doctrine');


      $results = $doc->getRepository('UserBundle:User')->findNames();


      $response = new Response(json_encode($results));
      header("Access-Control-Allow-Origin: *");
      $response->headers->set('Access-Control-Allow-Origin', '*');
      $response->headers->set('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, PATCH, OPTIONS');
      $response->headers->set('Content-Type', 'text/plain');

      return $response;
  }

  public function updatedListAction(Request $request, $name, $school)
  {
//      if (!$request->isXmlHttpRequest())
//      {
//          return $this->redirectToRoute('houses');
//      }

      $doc = $this->getDoctrine();

      $user = $doc->getRepository('UserBundle:User')->findOneByName($name);

      if ($user){

          $schoolEntity = $doc->getRepository('AppBundle:House')->findOneByName($school);

          if ($schoolEntity){

              $user->setTeamId($schoolEntity);

              $doc->getManager()->persist($user);
              $doc->getManager()->flush();
          }
      }

      $response = new Response();
      header("Access-Control-Allow-Origin: *");
      $response->headers->set('Access-Control-Allow-Origin', '*');
      $response->headers->set('Access-Control-Allow-Methods', 'POST, GET, PUT, DELETE, PATCH, OPTIONS');
      $response->headers->set('Content-Type', 'text/plain');

      return new Response();
  }
}

 ?>
