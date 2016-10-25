<?php

include('resource_controller.php');
include_once('request.php');

class RequestController
{
    const VALID_METHODS = array('GET', 'POST', 'PUT', 'DELETE');
    const VALID_PROTOCOL = array('HTTP/1.0','HTTP/1.1', 'HTTPS');

    private function create_request($request_info)
    {
        if (!self::is_valid_method($request_info['REQUEST_METHOD'])) {
            return array("code" => "405", "message" => "method not allowed");

        }


        return new Request($request_info['REQUEST_METHOD'], $request_info['SERVER_PROTOCOL'], $request_info['SERVER_ADDR'], $request_info['REMOTE_ADDR'], $request_info['REQUEST_URI'],
            $request_info['QUERY_STRING'], file_get_contents('php://input'));

    }
    //$var_dump = create_request;
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

    public function is_valid_seaddr($method)
    {
        if (is_null($method) || !in_array($method, self::VALID_METHODS))
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

    public function is_valid_uri($method)
    {
        if (is_null($method) || !in_array($method, self::VALID_METHODS))
            return false;

        return true;
    }

    public function is_valid_qstring($method)
    {
        if (is_null($method) || !in_array($method, self::VALID_METHODS))
            return false;

        return true;
    }

    public function is_valid_body($method)
    {
        if (is_null($method) || !in_array($method, self::VALID_METHODS))
            return false;

        return true;
    }


    public function execute()
    {
        $request = self::create_request($_SERVER);
        $resource_controller = new ResourceController();
        return $resource_controller->treat_request($request);
    }


}
