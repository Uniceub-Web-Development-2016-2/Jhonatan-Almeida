<?php

include("request.php");


$request = new Request($method, $protocol, $server_ip, $remote_ip, $resource, $params);
var_dump($request);
