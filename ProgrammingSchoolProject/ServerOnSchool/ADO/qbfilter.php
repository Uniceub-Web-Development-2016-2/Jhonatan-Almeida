<?php


   class QBFilter extends QBExpression
   {

   	private $variable;
   	private $operator;
   	private $value;

   	public function __construct($variable, $operator, $value)
   	{
   		$this->variable = $variable;
   		$this->operator = $operator;
   		$this->value = $this->transform($value);
   	}

	private function transform($value)//Como fazer para funcionar com json?
	{
		if(is_array($value)){

			foreach ($value as $x) {

				if(is_integer($x))
				{
					$foo[] = $x;
				}
				else if(is_string($x)
				{
					$foo[] = "'$x'";
				}
			}
			$result = '('.implode(',', $foo).')';
		}
	}


		/*else if($)
		 strtotime() fazer conversao de string para date!!!
	}*/

	public function dump()
	{
		//return $this->variable.$this->operator.$this->value;
		return"{$this->variable} {$this->operator} {$this->value}";
	}


}