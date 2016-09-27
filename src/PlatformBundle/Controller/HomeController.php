<?php

namespace PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class HomeController extends Controller
{
  public function indexAction()
  {
    $listOfHouses = $this->get('doctrine')->getRepository('AppBundle:House')->getAllNames();
    return $this->render('PlatformBundle::index.html.twig');
  }
}

 ?>
