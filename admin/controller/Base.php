<?php
namespace admin\controller;

use think\Db;
use think\Session;
use think\Controller;

class Base extends Controller
{

    protected $beforeActionList = [
        'checkUser' => ['except' => 'login,loginaction'],
    ];

    public function _initialize()
    {
        $basic = $this->getConfig('basic');
        $this->assign('basic', $basic);
    }

    protected function checkUser()
    {
        if (!session::has('adminid') and !session::has('adminname')) {
            $this->redirect('login');
        }
    }

    private function getConfig()
    {
        $config = Db::table('ycms_config')->where('1')->select();
        return $config;
    }


}