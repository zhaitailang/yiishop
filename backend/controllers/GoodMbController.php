<?php

namespace backend\controllers;

use Yii;
use common\models\Good;
use common\models\GoodImage;
use common\models\GoodMb;
use backend\models\GoodMbSearch;
use common\models\GoodMbv;
use yii\web\Controller;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\base\Exception;
use backend\models\GoodMbvSearch;
use api\models\GoodCode;
use Symfony\Component\Yaml\Dumper;
use Symfony\Component\Yaml\Tests\DumperTest;

/**
 * GoodMbController implements the CRUD actions for GoodMb model.
 */
class GoodMbController extends Controller
{
    /**
     * @inheritdoc
     */
    public function behaviors()
    {
        return [
            'verbs' => [
                'class' => VerbFilter::className(),
                'actions' => [
                    //'delete' => ['POST'],
                ],
            ],
        ];
    }

    /**
     * Lists all GoodMb models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new GoodMbSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single GoodMb model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {

        $model = $this->findModel($id);
        $goodmodel = $this->findGoodModel($model->good_id);
        return $this->render('view', [
            'model' => $model,
            'goodmodel' =>$goodmodel,
        ]);
    }

    /**
     * Creates a new GoodMb model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
//     public function actionCreate()
//     {
//         $model = new GoodMb();

//         if ($model->load(Yii::$app->request->post()) && $model->save()) {
//             return $this->redirect(['view', 'id' => $model->id]);
//         } else {
//             return $this->render('create', [
//                 'model' => $model,
//             ]);
//         }
//     }

    /**
     * Updates an existing GoodMb model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $model->updated_at = time();
        $Good =  Yii::$app->request->post('Good');
        $model->cate_id = $Good['cate_id'];
        $model->brand_id = $Good['brand_id'];
        $goodmodel = $this->findGoodModel($model->good_id);
        $goodmodel->updated_at = time();
        $imagemodel = $this->findGoodImageModel($goodmodel->id);
        
        //获取报价状态
//         $goodmb = Yii::$app->request->post('GoodMb');
//         $goodmb_status = $goodmb['status'];
        //print_r($goodmb_status);exit();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            //如果商家报价状态为0 则同步商品状态为0
//             if($goodmb_status == 0){
//                 $goodmodel->status = 0;
//                 //商品改为后台发布
//                 $goodmodel->user_id = 0;
//             }
            //商品
            if ($goodmodel->load(Yii::$app->request->post()) && $goodmodel->save()) {
                //商品图片
                $GoodImage = Yii::$app->request->post('GoodImage');
                $image_url = $GoodImage['image_url'];
                $imagemodel->good_id = $goodmodel->id;
                $imagemodel->image_url = '';
                if (is_array($image_url) && $image_url) {
                    $imagemodel->image_url = implode(',', $image_url);
                }
                if ($imagemodel->save() && $imagemodel->validate()) {
                    return $this->redirect(['view', 'id' => $model->id]);
                }else {
                    return $this->render('update', [
                        'model' => $model,
                        'goodmodel' =>$goodmodel,
                        'imagemodel' =>$imagemodel,
                    ]);
                }
            } else {
                return $this->render('update', [
                    'model' => $model,
                    'goodmodel' =>$goodmodel,
                    'imagemodel' =>$imagemodel,
                ]);
            }
        } else {
            return $this->render('update', [
                'model' => $model,
                'goodmodel' =>$goodmodel,
                'imagemodel' =>$imagemodel,
            ]);
        }
    }

    /**
     * Deletes an existing GoodMb model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
//     public function actionDelete($id)
//     {
//         $this->findModel($id)->delete();

//         return $this->redirect(['index']);
//     }

    /**
     * Deletes an existing Good model.
     * If delete is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $transaction = \Yii::$app->db->beginTransaction();
        try {
            
            $model = $this->findModel($id);
            $model->is_del = 1;
            if($model->save()){
                //修改商品属性删除状态
                $goodmbv = GoodMbv::find()->where(['mb_id'=>$model->id])->all();
                foreach ($goodmbv as $mbv) {
                    $mbvEdit = array();
                    $mbvEdit['is_del'] = 1;
                    GoodMbv::updateAll($mbvEdit, 'id=:id', array(':id' => $mbv->id));
                }
            }
            $transaction->commit();
            Yii::$app->getSession()->setFlash('success', '操作成功！');
            return $this->redirect(['index']);
        } catch(Exception $e) {
            # 回滚事务
            $transaction->rollback();
            Yii::$app->getSession()->setFlash('error', '操作失败，请重试。'.$e->getMessage());
            return $this->redirect(['index']);
        }
    }

    /**
     * Finds the GoodMb model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return GoodMb the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = GoodMb::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    /**
     * Finds the Good model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return GoodMb the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findGoodModel($id)
    {
        if (($model = Good::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    /**
     * Finds the Goodimages model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return GoodMb the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findGoodImageModel($id)
    {
        if (($model = GoodImage::find()->where(['good_id' => $id])->one()) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    /**
     * Lists all GoodMbv models.
     * @return mixed
     */
    public function actionGoodMbv($id)
    {
        
        $searchModel = new GoodMbvSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
    
        return $this->render('good-mbv', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }
    
    //审核通过
    public function actionStatusOk($id)
    {
        $model = $this->findGoodMbvModel($id);
        $goodmb = GoodMb::find()->where(['id'=>$model->mb_id])->one();
        if($model->status != 2){
            Yii::$app->getSession()->setFlash('error', '非法操作！');
            return $this->redirect(['good-mbv','id'=>$model->mb_id]);
        }
        
        //查询商品报价信息
        $goodcode = new GoodCode();
        
        $transaction = \Yii::$app->db->beginTransaction();
        try {
            //更改商品属性状态
            $model->status = 0;
            $model->updated_at=time();
            
            //更改商家报价的状态
            $goodmb->status = 0;
            $goodmb->updated_at=time();
            //判断该条形码在库中是否已存在
            $gb = GoodCode::find()->where(['bar_code'=>$model->bar_code])->one();
            if(!$gb){
                //添加进商品条形码库
                $goodcode->model_text=$model->model_text;
                $goodcode->bar_code=$model->bar_code;
                $goodcode->good_id = $goodmb->good_id;
                $goodcode->created_at=time();
                $goodcode->updated_at=time();
            }
           
            if($model->save()&&$goodmb->save()){
                if($goodcode->save()){
                    $transaction->commit();
                    Yii::$app->getSession()->setFlash('success', '操作成功！');
                }else{
                    $transaction->commit();
                    Yii::$app->getSession()->setFlash('success', '操作成功！');
                }
            }else{
                Yii::$app->getSession()->setFlash('error', '操作失败！');
            }
            
            return $this->redirect(['good-mbv','id'=>$model->mb_id]);
        } catch(Exception $e) {
            # 回滚事务
            $transaction->rollback();
            Yii::$app->getSession()->setFlash('error', '操作失败，请重试。');
            return $this->redirect(['good-mbv','id'=>$model->mb_id]);
            
            //return $e->getMessage();
        }
        
        
//         $model->status = 0;
//         $model->updated_at=time();
//         if ($model->save()) {
//             Yii::$app->getSession()->setFlash('success', '操作成功！');
//             return $this->redirect(['good-mbv','id'=>$goodmb->mb_id]);
//         } else {
//             Yii::$app->getSession()->setFlash('error', '操作失败，请重试。');
//             return $this->redirect(['good-mbv','id'=>$goodmb->mb_id]);
//         }
    }
    
    /**
     * Finds the GoodMbv model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return GoodMb the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findGoodMbvModel($id)
    {
        if (($model = GoodMbv::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
    
    public function actionGoodMbvUpdate($id)
    {
        $model = $this->findGoodMbvModel($id);
        
        $model->updated_at = time();
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['good-mbv','id' => $model->mb_id]);
        } else {
            return $this->render('good-mbv-update', [
                'model' => $model,
            ]);
        }
    }
    
    public function actionGoodMbvDelete($id)
    {
        $transaction = \Yii::$app->db->beginTransaction();
        try {
        
            $model = $this->findGoodMbvModel($id);
            $model->is_del = 1;
            $model->save();
            
            $transaction->commit();
            Yii::$app->getSession()->setFlash('success', '操作成功！');
            return $this->redirect(['good-mbv','id' => $model->mb_id]);
        } catch(Exception $e) {
            # 回滚事务
            $transaction->rollback();
            Yii::$app->getSession()->setFlash('error', '操作失败，请重试。'.$e->getMessage());
            return $this->redirect(['good-mbv','id' => $model->mb_id]);
        }
    }
}
