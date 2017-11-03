<?php

namespace api\modules\v1\controllers;

use Yii;
use yii\rest\ActiveController;
use yii\web\Response;

class MbgoodsController extends ActiveController
{
    public $modelClass = 'api\models\Good';
    
    protected function verbs()
    {
        return [
            'index' => ['POST'],
        ];
    }
    
    public function actions()
    {
        $action =  parent::actions();
        unset($action['index'],$action['view'],$action['create'],$action['update'],$action['delete']); //所有动作删除
    }
    
    public function actionIndex(){
       $id = (int)Yii::$app->request->post("id", '0');
       
       if(!$id || $id <= 0){
            $good['code'] = '80000';
            $good['msg'] = '参数不合法或缺少参数';
            return $good;
        }
        $modelClass = $this->modelClass;
        //获取商家商品信息
        $good_arr = $modelClass::find()->select(['*'])->where(['status'=>0,'id'=>$id])->with([
            'goodMb'=> function ($query) {
                $query->select(['*'])->where(['status'=>0])->with([
                    'user'=> function ($query){
                        $query->select(['*']);
                    },
                    'goodMbv'=> function ($query){
                        $query->select(['*'])->where(['status'=> 0])->orderBy('price asc');
                    },
                    'freight'=> function ($query){
                        $query->select(['*'])->with([
                            'freightVars'=> function ($query){
                                $query->select(['*'])->orderBy('freight asc');
                            }
                        ]);
                    },
                    'order'=> function ($query){
                        $query->select(['id','mb_id','pay_num'])->where(['status' =>4])->count();
                    },
                    'place'=> function ($query){
                        $query->select(['*']);
                    },
                ]);
            },
            'brand'=> function ($query){
                $query->select(['*']);
            },
            ])
            ->asArray()
            ->one();
        if(!empty($good_arr)){
            //获取商品标题
            $goods['good_title']=$good_arr['title'];
            //获取商品码
            $goods['good_num']=$good_arr['good_num'];
            //获取商品品牌名
            $goods['brand_name']=$good_arr['brand']['title'];
            foreach ($good_arr['goodMb'] as $k => $v){
                $goods['good_mb'][$k]['mb_id']=$v['id'];
                //商家昵称
                $goods['good_mb'][$k]['uesr_name']=$v['user']['nickname'];
                //查询商品已售数量
                $goods['good_mb'][$k]['sold_num']=$this->actionArrvalsum($v['order'] , 'pay_num');
                //查询商品最低运费 
                $goods['good_mb'][$k]['freight']=isset($v['freight']['freightVars'][0]['freight'])?$v['freight']['freightVars'][0]['freight']:0;
                //查询商品发货地
                $goods['good_mb'][$k]['place'] = $v['place']['name'];
                //商品最低价格
                $goods['good_mb'][$k]['price_min'] = isset($v['goodMbv'][0]['price'])?$v['goodMbv'][0]['price']:0;
                //商品总库存
                $goods['good_mb'][$k]['stock_sum'] = $this->actionArrvalsum($v['goodMbv'], 'stock_num');
            }
        }else{
            $good['code'] = '10002';
            $good['msg'] = '商品不存在';
            return $good;
        }
        
        $good['code'] = '200';
        $good['msg'] = '';
        $good['data'] = $goods;
        return $good;
    }
    //数组多维转一维 求最小
    public function actionArrvalmin($array,$array_key){
        $arr = array();
        foreach($array as $value) {
            $arr[] = $value[$array_key];
        }
        $arr = array_values($arr);
        //print_r($arr);exit();
        $arr_min = array_search(min($arr),$arr);
        
        return $arr[$arr_min];
    }
    //数组多维转一维 求和
    public function actionArrvalsum($array,$array_key){
        $arr = array();
        foreach($array as $value) {
            $arr[] = $value[$array_key];
        }
        $arr_sum = array_sum($arr);
        return $arr_sum;
    }
}
