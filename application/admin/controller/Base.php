<?php
namespace app\admin\controller;

use app\admin\model\Log;
use think\Session;

class Base extends \think\Controller
{
    public function checkUser()
    {
        if (!Session::has('adminid') and !Session::has('adminname')) {
            $this->redirect('Index/login');
        }
    }

    //系统日记
    public function runlog($loguser="",$content,$type=1){
        $log = new Log();
        $array = array(
            'username'=>$loguser,
            'ip'=>request()->ip(),
            'content'=>$content,
            'logtype'=>$type,
            'timeline'=>time(),
        );
        $log->save($array);
    }

}
