<?php

namespace AppBundle\Controller;

use Doctrine\DBAL\Types\DateType;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\Form\Extension\Core\Type\TextType;
use Symfony\Component\Form\Extension\Core\Type\TextareaType;
use Symfony\Component\Form\Extension\Core\Type\DateTimeType;
use Symfony\Component\Form\Extension\Core\Type\SubmitType;
use Symfony\Component\Form\Extension\Core\Type\IntegerType;
use AppBundle\Entity\Defis;
use AppBundle\Entity\Question;
use Symfony\Component\HttpFoundation\Request;
use Symfony\Component\Validator\Constraints\Date;

class DefisController extends Controller
{
  public function indexAction() {

    $doc = $this->get('Doctrine');

    $defis = $doc->getRepository('AppBundle:Defis')->findActualDefis();

    $questions = $doc->getRepository('AppBundle:Question')->findActualQuestions();

    return $this->render('defis.html.twig', array(
        "defis" => $defis,
        "questions" => $questions
    ));
  }

  public function newAction(Request $request) {


    $this->denyAccessUnlessGranted('ROLE_ADMIN', null, 'Unable to access this page');

    $manager = $this->get('Doctrine')->getManager();

    $defis = new Defis();

    $defis->setStartDate(new \DateTime());
      $defis->setEndDate(new \DateTime('+1 day'));

    $form = $this->createFormBuilder($defis)
      ->add('name', TextType::class)
      ->add('description', TextareaType::class)
        ->add('points', IntegerType::class)
      ->add('startDate', DateTimeType::class)
        ->add('endDate', DateTimeType::class)
      ->add('place', TextType::class)
      ->add('save', SubmitType::class, array('label' => 'Add Challenge'))
      ->getForm()
      ;

      $form->handleRequest($request);

    if ($form->isSubmitted() && $form->isValid()){
        $defis = $form->getData();
        $manager->persist($defis);
        $manager->flush();
      }

    $question = new Question();

      $question->setStartDate(new \DateTime());
      $question->setEndDate(new \DateTime('+1 day'));


    $form_question = $this->createFormBuilder($question)
      ->add('question', TextareaType::class)
      ->add('points', IntegerType::class)
        ->add('startDate', DateTimeType::class)
        ->add('endDate', DateTimeType::class)
      ->add('save', SubmitType::class, array('label' => 'Post question'))
      ->getForm()
      ;

        $form_question->handleRequest($request);

    if ($form_question->isSubmitted() && $form_question->isValid()){
      $question = $form_question->getData();
      $manager->persist($question);
      $manager->flush();

    }

    return $this->render('addDefis.html.twig', array (
      "form" => $form->createView(),
      "form_question" => $form_question->createView()
    ));
  }
}

 ?>
