<?php

var_dump($_SERVER['REQUEST_METHOD']);
var_dump($_SERVER['SERVER_PROTOCOL']);


$request = new Request($method, $protocol, $server_ip, $remote_ip, $resource, $params)
var_dump($request);
