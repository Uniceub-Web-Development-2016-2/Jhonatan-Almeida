<?php 


abstract class QBInstruction
{
	
	protected $sql;
	protected $criteria;

	final public function setEntity($entity)
	{
		$this->entity = $entity;
	}
	final public function getEntity()
	{
		return $this->entity;
	}

	public function setCriteria($criteria)
	{
		$this->criteria = $criteria;
	}

	abstract function getInstruction()
	{
	}
}