<?php


final class QBDelete extends QBInstruction
{
	public function getInstruction()
	{
		$this->sql = "DELETE FROM {$this->entity}";
		if($this->criteria)
		{
			$expression = $this=>criteria->dump();
			if($expression)
			{
				$this->sql .= ' WHERE '.$expression;
			}
		}
		return $this->sql;
	}
}