<?php

namespace AppBundle\Controller;

use Sensio\Bundle\FrameworkExtraBundle\Configuration\Route;
use Symfony\Bundle\FrameworkBundle\Controller\Controller;
use Symfony\Component\HttpFoundation\Request;

class AnswerController extends Controller
{
    public function viewAnswersAction()
    {
        $doc = $this->get('Doctrine');

        $questions = $doc->getRepository('AppBundle:Question')->findAll();

        $answerTab = array();

        foreach ($questions as $question){
          $answerTab[$question->getId()] = $doc->getRepository('AppBundle:Answer')->findByQuestion($question);
        }

        return $this->render('view_answers.html.twig', array(
            "answersTab" => $answerTab ,
            "questions" => $questions
        ));
    }

    public function getTableAndAnswersAction(Request $request, $question)
    {
      if (!$request->isXmlHttpRequest()){
        return $this->redirectToRoute('view_answers');
      }

      $doc = $this->get('Doctrine');

      $questionObject = $doc->getRepository('AppBundle:Question')->findByQuestion($question);

      $answers = $doc->getRepository('AppBundle:Answer')->findAllByQuestion($questionObject);

      $teams = array(
        "Gryffondor" => 0,
        "Serdaigle" => 0,
        "Poufsouffle" => 0,
        "Serpentard"  => 0
      );

      foreach ($answers as $answer){
        $teams[$answer->getUser()->getTeam()->getName()] += 1;
      }

      $countAnswers = $this->render('ToInclude/answer_by_team.html.twig', array(
        "gryffondor" => $teams["Gryffondor"],
        "serdaigle" => $teams["Serdaigle"],
        "poufsouffle" => $teams["Poufsouffle"],
        "serpentard" => $teams["Serpentard"],
      ))
      ;

    }
}
