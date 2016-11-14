<?php
namespace app\admin\controller;

use app\admin\model\Product as ProductModel;
use think\Request;
use think\Session;

class Product extends Base
{
    public function index()
    {
        $list = ProductModel::where(1)->order('infoid asc')->paginate(10);
        return $this->fetch('index', ['list' => $list]);
    }

    public function productedit(Request $request)
    {
        $id = $request->param('id');
        $ProductModel = new ProductModel();
        $data = $ProductModel->where("infoid = $id")->find()->getData();
        return $this->fetch('edit', ['data' => $data,'type' => 'edit']);
    }

    public function productadd()
    {
        return $this->fetch('edit',['type' => 'add']);
    }

    public function productsave(Request $request)
    {
        $id = $request->param('id');
        $ProductModel = new ProductModel();
        if(!empty($id)) {
            $product = $ProductModel->where("infoid='" . $id . "'")->find();
            $rs = false;
            if (!empty($request->param('title'))) {
                $product->title = $request->param('title');
                $rs = $product->save();
            }
        }else{
            $array = array(
                'timeline' => time(),
                'title' => $request->param('title'),
            );
            $rs = $ProductModel->save($array);
        }
        if ($rs) {
            $this->runlog(Session::get('adminname'), "编辑链接[$id]", 1);
            $this->success('编辑链接成功！', url('product/index'));
        } else {
            $this->error('编辑链接失败！');
        }

    }


}
