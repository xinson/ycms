<?php
namespace app\admin\controller;

use app\admin\model\Admin as AdminModel;
use app\admin\model\Authgroup;
use think\Request;
use Think\Session;

class Admin extends Base
{
    // 初始化
    protected function _initialize()
    {
        $this->checkUser();
    }

    public function index()
    {
        $Admin = new AdminModel();
        $list = $Admin->alias('a')->field(' a.*, g.groupname')->join('ycms_authgroup g', 'a.groupid=g.groupid ', 'left')->select();
        return $this->fetch('index', ['list' => $list]);
    }

    public function adminedit(Request $request)
    {
        $id = $request->param('id');
        $Admin = new AdminModel();
        $data = $Admin->where("adminid = $id")->find()->getData();

        $Group = new Authgroup();
        $list = $Group->select();
        return $this->fetch('edit', ['data' => $data, 'list' => $list, 'adminname' => Session::get('adminname'), 'type' => 'edit']);
    }

    public function adminadd()
    {
        $Group = new Authgroup();
        $list = $Group->select();
        return $this->fetch('edit', ['list' => $list, 'adminname' => Session::get('adminname'), 'type' => 'add']);
    }

    public function changepassword()
    {
        $id = Session::get('adminid');
        $Admin = new AdminModel();
        $data = $Admin->where("adminid = $id")->find()->getData();
        return $this->fetch('change_password', ['data' => $data]);
    }

    public function passwordSave(Request $request)
    {
        $id = Session::get('adminid');
        $AdminModel = new AdminModel();
        $admin = $AdminModel->where("adminid = $id")->find();
        $opwd = $request->param('oldpassword');
        $npwd = $request->param('newpassword');
        $cpwd = $request->param('confirmpassword');

        if (empty($opwd)) {
            $this->error('原密码不能为空');
        } elseif (empty($npwd)) {
            $this->error('新密码不能为空');
        } elseif (empty($cpwd)) {
            $this->error('确认密码不能为空');
        } elseif ($cpwd != $npwd) {
            $this->error('确认密码和新密码输入不一致');
        } elseif (strlen($npwd) < 4 || strlen($npwd) > 16) {
            $this->error('密码长度不正确');
        }

        if (md5($opwd) != $admin->password) {
            $this->error('旧密码不正确');
        }

        $admin->password = md5($npwd);
        if ($admin->save()) {
            $this->runlog(Session::get('adminname'), "编辑用户密码[" . Session::get('adminname') . "]", 1);
            $this->success('编辑密码成功！');
        } else {
            $this->error('编辑密码失败！');
        }
    }

    public function adminSave(Request $request)
    {
        if ($request->param('action') == 'saveadd') {
            $adminname = $request->param('adminname');
            $pwd = $request->param('password');
            $gid = $request->param('groupid');
            $flag = $request->param('flag');
            $super = $request->param('super');
            $memo = $request->param('memo');
            $timer = time();
            if (empty($adminname)) {
                $this->error('账号不能为空');
            }
            if (empty($pwd)) {
                $this->error('登录密码不能为空');
            }
            $admin = new AdminModel();
            $have = $admin->where("adminname='" . $adminname . "'")->find();
            if ($have === NULL) {
                $data = array(
                    'adminname' => $adminname,
                    'password' => md5($pwd),
                    'groupid' => $gid,
                    'super' => $super,
                    'timeline' => $timer,
                    'flag' => $flag,
                    'memo' => $memo,
                );
                $res = $admin->save($data);
                if ($res) {
                    $this->runlog(Session::get('adminname'), "添加管理用户[$adminname]", 1);
                    $this->success('添加管理用户成功！', url('admin/index'));
                } else {
                    $this->error('添加管理用户失败！');
                }

            } else {
                $this->error('该帐号已存在，请填写另外一个！');
            }
        } elseif ($request->param('action') == 'saveedit') {
            $gid = $request->param('groupid');
            $flag = $request->param('flag');
            $super = $request->param('super');
            $memo = $request->param('memo');
            $pwd = $request->param('password');
            $id = $request->param('id');
            $timer = time();
            $adminModel = new AdminModel();
            $admin = $adminModel->where("adminid='" . $id . "'")->find();
            if (!empty($pwd)) {
                $admin->password = md5($pwd);
            }
            $admin->groupid = $gid;
            $admin->super = $super;
            $admin->timeline = $timer;
            $admin->flag = !empty($flag) ? 1 : 0;
            $admin->memo = $memo;
            if ($admin->save()) {
                $this->runlog(Session::get('adminname'), "编辑管理用户[$id]", 1);
                $this->success('编辑管理用户成功！', url('admin/index'));
            } else {
                $this->error('编辑管理用户失败！');
            }
        }
    }

    //删除管理用户
    public function deleteAdmin(Request $request)
    {
        $admin = new AdminModel();
        $arrid = !empty($request->param('id')) ? $request->param('id') : "";
        if (Session::get('adminid') == $arrid) {
            $this->error('不能删除自己');
        }
        if ($arrid == "") {
            $this->error('请选项要删除的数据');
        }
        $admin->where("adminid='" . $arrid . "'")->delete();
        $this->runlog(Session::get('adminname'), "删除管理用户[id=$arrid]", 1);
        $this->success('删除管理用户成功');
    }


}
