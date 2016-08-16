<?php

class Request{
	private $method;
	private $protocol;
	private $server_ip;
	private $remote_ip;
	private $resource;
	private $params = array();

	public function __construct($method, $protocol, $server_ip, $remote_ip, $resource, $params){
		$method = $_SERVER['REQUEST_METHOD'];
		$protocol = $_SERVER['SERVER_PROTOCOL'];	
		$server_ip = $_SERVER['SERVER_ADDR'];
		$remote_ip = $_SERVER['REMOTE_ADDR'];
		$resource = $_SERVER['REQUEST_URI'];	
		$params = array($_SERVER['QUERY_STRING']);	
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

	public function __get($server_ip){
		return $this->$server_ip;
	}
	public function __set($server_ip, $Value){
		$this->$server_ip = $Value;
	}

	public function __get($remote_ip){
		return $this->$remote_ip;
	}
	public function __set($remote_ip, $Value){
		$this->$remote_ip = $Value;
	}

	public function __get($resource){
		return $this->$resource;
	}
	public function __set($resource, $Value){
		$this->$resource = $Value;
	}

	public function __get($params){
		return $this->$params;
	}
	public function __set($params, $Value){
		$this->$params = $Value;
	}
	public function __toString(){
		$temp = "";
		foreach($params as &$Value){
			if(empty($params)) {     
			}else{
			$temp = $params;
		}
		return $temp;
	}

}
