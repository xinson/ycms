<?php
namespace app\index\controller;

use app\admin\model\Product as ProductModel;

class Index
{

    public function index()
    {
        $list = ProductModel::where(1)->field('title as url')->order('infoid desc')->select();
        return json($list);
    }

}
