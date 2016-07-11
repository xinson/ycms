<?php
namespace admin\controller;

class Index extends Base
{

    public function index()
    {
        return $this->fetch('index');
    }

    public function login()
    {
        return $this->fetch('login');
    }

    public function loginaction()
    {
        print_r($_POST);
        exit();
    }

}
