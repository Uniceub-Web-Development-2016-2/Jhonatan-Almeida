<?php


final class QBSelecet extends QBInstruction
{
	private $columns;


	public function addColumn($column)
	{
		$this->column[] = $column;
	}

	public function getInstruction()
	{
		$this->sql = 'SELECT ';
		$this->sql .= implode(', ', $this->columns);
		$this->sql .= ' FROM'.$this->entity;
		if($this->criteria)
		{
			$expression = $this->criteria->dump();
			if($expression)
			{
				$this->sql .= ' WHERE'.$expression;
			}
			$order = $this->criteria->getProperty('order');
			$limit = $this->criteria->getProperty('limit');
			$offset = $this->criteria->getProperty('offset');

			if($order)
			{
				$this->sql .= ' ORDER BY'.$order;
			}
			if ($limit) 
			{
				$this->sql .= ' LIMIT'.$limit;
			}
			if ($offset) 
			{
				$this->sql .= ' OFFSET'.$offset;
			}
			return $this->sql;
		}
	}















}