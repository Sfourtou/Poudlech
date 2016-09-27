<?php

namespace PlatformBundle\Controller;

use Symfony\Bundle\FrameworkBundle\Controller\Controller;

class HomeController extends Controller
{
  public function indexAction()
  {
    return $this->render('PlatformBundle::spin.html.twig');
  }
}

 ?>
