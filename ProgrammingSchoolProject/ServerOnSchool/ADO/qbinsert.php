 1<?php

final class QBInsert extends QBInstruction
{
	
	public function setRowData($column, $value)
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

	public function setCriteria($criteria)
	{
		throw new Exception("Cannot call setCriteria from ".__CLASS__);
	}

	public function getInstruction()
	{
		$this->sql = "INSERT INTO {$this->entity} (";
		$columns = implode(', ', array_keys($this->columnValues));
		$values = implode(', ', array_values($this->columnValues));
		$this->sql .= $columns. ')';
		$this->sql .= " values ({$values})";
		return $this->sql;
	}
}