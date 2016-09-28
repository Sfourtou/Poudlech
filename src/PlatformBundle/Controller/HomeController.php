<?php

namespace PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class HomeController extends Controller
{
  public function indexAction()
  {
      $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'Unable to access this page');
      return $this->render('PlatformBundle::spin.html.twig');
  }
}

 ?>
