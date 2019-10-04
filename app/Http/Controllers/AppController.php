<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Contracts\Routing\ResponseFactory;

class AppController extends Controller
{

    protected $response;

    public function __construct(ResponseFactory $response){
        $this->response = $response;
    }

    public function initial(){
        dd(ssr('js/app-server.js')->fallback('<div id="app"></div>')->render());

        return $this->response->view('home');
    }
}
