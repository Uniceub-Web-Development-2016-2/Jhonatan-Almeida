<?php


abstract class QBExpression
{
	
	const AND_OPERATOR = ' AND ';
	const OR_OPERATOR = ' OR ';

	abstract public function dump()
	{
 
	}
}