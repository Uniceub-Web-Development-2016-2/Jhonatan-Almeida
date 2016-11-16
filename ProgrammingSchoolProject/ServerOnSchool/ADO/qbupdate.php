<?php


final class QBUpdate extends QBInstruction
{
	public function setRowData()
	{
		if(is_string($value))
		{
			$value = addslashes($value);
			$this->columnValues[$column] = "'$value'";
		}elseif (is_bool($value)) 
		{
			$this->columnValues[$column] = $value ? 'TRUE' : 'FALSE';
		}
	}elseif (isset($value)) {
		$this->columnValues[$column] = $value;
	}else
	{
		$this->columnValues[$column] = "NULL";
	}
	
	public function getInstruction($value='')
	{
		$this->sql = "UPDATE {$this->entity}";
		if($this->columnValues)
		{
			foreach ($this->columnValues as $column => $value) {
				$set[] = "{$column} = {$value}";
			}
		}
		$this->sql .= ' SET '.implode(', ', $set);
		if($this->criteria)
		{
			$this->sql .= ' WHERE '.$this->criteria->dump();
		}
		return $this->sql;
	}


}