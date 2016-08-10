<?php

class Request{
	private $method;
	private $protocol;
	private $ip;
	private $resource;
	private $parameters = array();

	public function __construct($mehod, $protocol, $ip, $resource, $parameters){
		$this->$ids = $ids;
		$this->$protocol = $protocol;	
		$this->$ip = $ip;
		$this->$resource = $resource;	
		$this->$parameters = $parameters;	
	}

	public function __get($method){
		return $this->$method;
	}
	public function __set($method, $Value){
		$this->$method = $Value;
	}

	public function __get($protocol){
		return $this->$protocol;
	}
	public function __set($protocol, $Value){
		$this->$protocol = $Value;
	}

	public function __get($ip){
		return $this->$ip;
	}
	public function __set($ip, $Value){
		$this->$ip = $Value;
	}

	public function __get($resource){
		return $this->$resource;
	}
	public function __set($resource, $Value){
		$this->$resource = $Value;
	}

	public function __get($parameters){
		return $this->$parameters;
	}
	public function __set($parameters, $Value){
		$this->$parameters = $Value;
	}
	public function __toString(){
		return $this->$parameters;
	}

}
