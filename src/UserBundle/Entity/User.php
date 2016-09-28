<?php

namespace UserBundle\Entity;

use FOS\UserBundle\Model\User as BaseUser;
use Doctrine\ORM\Mapping as ORM;

/**
 * @ORM\Entity(repositoryClass="UserBundle\Repository\UserRepository")
 * @ORM\Table(name="fos_user")
**/

  class User extends BaseUser
  {
    /**
     * @ORM\Id
     * @ORM\Column(type="integer")
     * @ORM\GeneratedValue(strategy="AUTO")
    **/
    protected $id;

    /**
     * @ORM\ManyToOne(targetEntity="AppBundle\Entity\House")
     * @ORM\JoinColumn(name="team_id", referencedColumnName="id")
    **/
    private $teamId;

      /**
       * @ORM\Column(type="string")
       **/
    private $name;

  /**
   * @ORM\Column(type="string")
   **/
  private $firstName;

      /**
       * @ORM\Column(type="boolean", nullable=true)
       */
      private $isTeamLeader;

    public function __construct()
    {
      parent::__construct();
    }

    /**
     * Add teamId
     *
     * @param \AppBundle\Entity\House $teamId
     *
     * @return User
     */
    public function addTeamId(\AppBundle\Entity\House $teamId)
    {
        $this->teamId[] = $teamId;

        return $this;
    }

    /**
     * Remove teamId
     *
     * @param \AppBundle\Entity\House $teamId
     */
    public function removeTeamId(\AppBundle\Entity\House $teamId)
    {
        $this->teamId->removeElement($teamId);
    }

    /**
     * Get teamId
     *
     * @return \Doctrine\Common\Collections\Collection
     */
    public function getTeamId()
    {
        return $this->teamId;
    }

    /**
     * Set teamId
     *
     * @param \AppBundle\Entity\House $teamId
     *
     * @return User
     */
    public function setTeamId(\AppBundle\Entity\House $teamId = null)
    {
        $this->teamId = $teamId;

        return $this;
    }

    /**
     * Set name
     *
     * @param string $name
     *
     * @return User
     */
    public function setName($name)
    {
        $this->name = $name;

        return $this;
    }

    /**
     * Get name
     *
     * @return string
     */
    public function getName()
    {
        return $this->name;
    }

    /**
     * Set firstName
     *
     * @param string $firstName
     *
     * @return User
     */
    public function setFirstName($firstName)
    {
        $this->firstName = $firstName;

        return $this;
    }

    /**
     * Get firstName
     *
     * @return string
     */
    public function getFirstName()
    {
        return $this->firstName;
    }

    /**
     * Set isTeamLeader
     *
     * @param \boolean $isTeamLeader
     *
     * @return User
     */
    public function setIsTeamLeader(\boolean $isTeamLeader)
    {
        $this->isTeamLeader = $isTeamLeader;

        return $this;
    }

    /**
     * Get isTeamLeader
     *
     * @return \boolean
     */
    public function getIsTeamLeader()
    {
        return $this->isTeamLeader;
    }
}
