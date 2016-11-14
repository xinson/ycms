<?php
namespace app\admin\controller;

use app\admin\model\Admin;
use think\Request;
use think\Session;

class Index extends Base
{
    public function index()
    {
        $this->checkUser();
        $info = array(
            '操作系统' => PHP_OS,
            '运行环境' => $_SERVER["SERVER_SOFTWARE"],
            'PHP运行方式' => php_sapi_name(),
            '上传附件限制' => ini_get('upload_max_filesize'),
            '执行时间限制' => ini_get('max_execution_time') . '秒',
            '服务器时间' => date("Y年n月j日 H:i:s"),
            '北京时间' => gmdate("Y年n月j日 H:i:s", time() + 8 * 3600),
            '服务器域名/IP' => $_SERVER['SERVER_NAME'] . ' [ ' . gethostbyname($_SERVER['SERVER_NAME']) . ' ]',
            '剩余空间' => round((disk_free_space(".") / (1024 * 1024)), 2) . 'M',
            'register_globals' => get_cfg_var("register_globals") == "1" ? "ON" : "OFF",
            'magic_quotes_gpc' => (1 === get_magic_quotes_gpc()) ? 'YES' : 'NO',
            'magic_quotes_runtime' => (1 === get_magic_quotes_runtime()) ? 'YES' : 'NO',
        );
        return $this->fetch('index', ['info' => $info]);
    }

    public function login()
    {
        if (Session::has('adminid')) {
            $this->redirect('index/index');
        }
        return $this->fetch('login');
    }

    public function loginaction(Request $request)
    {
        if (Session::has('adminid')) {
            $this->redirect('index/index');
        } else {
            if (empty($request->param('username'))) {
                $this->error('用户名不能为空');
            }
            if (empty($request->param('password'))) {
                $this->error('密码不能为空');
            }
            $pass = md5($request->param('password'));
            $name = $request->param('username');
            /** @var Admin $adminUser */
            $adminModel =  new Admin();
            $admin = $adminModel->where("adminname='" . $name . "'")->where("password='" . $pass . "'")->find();
            $user = '';
            if(!empty($admin)){
                $user = $admin->getData();
            }
            if ($user === NULL) {
                $this->runlog($name, "登录后台失败", 2);
                $this->error('用户名与密码不匹配');
            } else {
                if (empty($user['flag'])) {
                    $this->error('对不起，该帐号被禁止！');
                }
                $admin->logintimeline = time();
                $admin->logintimes = $user['logintimes'] + 1;
                $admin->loginip = request()->ip();
                $admin->save();
                Session::set('adminname', $user['adminname']);
                Session::set('adminid', $user['adminid']);
                Session::set('groupid', $user['groupid']);
                Session::set('super', $user['super']);
                $this->runlog($user['adminname'], "登录后台成功", 1);
                $this->redirect('index/index');
            }
        }
    }


    //退出
    public function logout()
    {
        if (Session::has('adminid') and Session::has('adminname')) {
            $this->runlog(Session::get('adminname'), "退出后台管理", 2);
            unset($_SESSION['adminname']);
            Session::delete('adminname');
            Session::delete('adminid');
            Session::delete('groupid');
            Session::delete('super');
            Session::clear();
            $this->redirect('index/login');
        }
    }

}
