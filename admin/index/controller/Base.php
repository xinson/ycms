<?php
namespace admin\index\controller;

use think\Db;
use think\Session;

class Base extends \think\Controller
{
    public function _initialize()
    {
        //$this->checkUser();
        $basic = $this->getConfig('basic');
        $this->assign('basic',$basic);
    }

    public function checkUser()
    {
        if (!session::has('adminid') and !session::has('adminname')) {
            $this->redirect('login');
        }
    }

    public function getConfig()
    {
        $config = Db::table('ycms_config')->where('1')->select();
        return $config;
    }


}