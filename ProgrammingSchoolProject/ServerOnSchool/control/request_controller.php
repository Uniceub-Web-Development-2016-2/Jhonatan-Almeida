<?php

include('resource_controller.php');
include_once('request.php');

class RequestController
{
    const VALID_METHODS = array('GET', 'POST', 'PUT', 'DELETE');
    const VALID_PROTOCOL = array('HTTP', 'HTTPS');

    private function create_request($request_info)
    {
        if (!self::is_valid_method($request_info['REQUEST_METHOD'])) {
            return array("code" => "405", "message" => "method not allowed");
        }
        if(!self::is_valid_protocol($request_info['SERVER_PROTOCOL'])){
            return array("code" => "400", "message" => "Could not perform the request");
        }
        if(!self::is_valid_readdr($request_info['REMOTE_ADDR'])){
            return array("code" => "403", "message" => "Invalid ip address");
        }
        if(!self::is_valid_uri($request_info['REQUEST_URI'])){
            return array("code" => "400", "message" => "The request could not be fulfilled");
        }
        if(!self::is_valid_qstring($request_info['QUERY_STRING'])){
            return array("code" => "422", "message" => "Entity could not be processed");
        }
        if(){
            // validação do body
            return array("code" => " ", "message" => "Invalid data assignment");
        }


        return new Request($request_info['REQUEST_METHOD'], $request_info['SERVER_PROTOCOL'], $request_info['SERVER_ADDR'], $request_info['REMOTE_ADDR'], $request_info['REQUEST_URI'],
            $request_info['QUERY_STRING'], file_get_contents('php://input'));

    }
    

    public function is_valid_method($method)
    {
        if (is_null($method) || !in_array($method, self::VALID_METHODS))
            return false;

        return true;
    }


    public function is_valid_protocol($protocol)
    {
        if( is_null($protocol) || !in_array($protocol, self::VALID_PROTOCOL))
            return false;

        return true;
    }

    public function is_valid_readdr()
    {
        // check for shared internet/ISP IP
        if (!empty($_SERVER['HTTP_CLIENT_IP']) && validate_ip($_SERVER['HTTP_CLIENT_IP'])) {
            return $_SERVER['HTTP_CLIENT_IP'];
        }

        // check for IPs passing through proxies
        if (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            // check if multiple ips exist in var
            if (strpos($_SERVER['HTTP_X_FORWARDED_FOR'], ',') !== false) {
                $iplist = explode(',', $_SERVER['HTTP_X_FORWARDED_FOR']);
                foreach ($iplist as $ip) {
                    if (validate_ip($ip))
                        return $ip;
                }
            } else {
                if (validate_ip($_SERVER['HTTP_X_FORWARDED_FOR']))
                    return $_SERVER['HTTP_X_FORWARDED_FOR'];
            }
        }
        if (!empty($_SERVER['HTTP_X_FORWARDED']) && validate_ip($_SERVER['HTTP_X_FORWARDED']))
            return $_SERVER['HTTP_X_FORWARDED'];
        if (!empty($_SERVER['HTTP_X_CLUSTER_CLIENT_IP']) && validate_ip($_SERVER['HTTP_X_CLUSTER_CLIENT_IP']))
            return $_SERVER['HTTP_X_CLUSTER_CLIENT_IP'];
        if (!empty($_SERVER['HTTP_FORWARDED_FOR']) && validate_ip($_SERVER['HTTP_FORWARDED_FOR']))
            return $_SERVER['HTTP_FORWARDED_FOR'];
        if (!empty($_SERVER['HTTP_FORWARDED']) && validate_ip($_SERVER['HTTP_FORWARDED']))
            return $_SERVER['HTTP_FORWARDED'];

        // return unreliable ip since all else failed
        return $_SERVER['REMOTE_ADDR'];
    }

    public function is_valid_uri($request)
    {
        if($request != htmlspecialchars($_SERVER['REQUEST_URI']))
            return false;

        return true;
        // redirecionar em caso de erro(com alerta)?
    }

    public function is_valid_qstring($qString)
    {
        if($qString != htmlspecialchars($_SERVER['QUERY_STRING']))
            return false;

        return true;
    }

    public function is_valid_body($body)
    {
     
     
    }


    public function execute()
    {
        $request = self::create_request($_SERVER);
        $resource_controller = new ResourceController();
        return $resource_controller->treat_request($request);
    }


}
