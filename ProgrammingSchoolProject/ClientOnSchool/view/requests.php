<?php

include('httpful.phar');


/*$get_request = 'http://172.22.51.134/aula8/user/search?first_name="'.$_POST['create'].'"';
$response = \Httpful\Request::get($get_request)->send();*/

$uri = 'http://172.22.51.134/aula8/user/create';
$response = \Httpful\Request::post($uri)->sendsJson()->body(json_encode($_POST))->send();                               

echo  $response->body;
