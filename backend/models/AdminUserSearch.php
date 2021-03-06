<?php

namespace backend\models;

use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\AdminUser;

/**
 * AdminUserSearch represents the model behind the search form about `backend\models\AdminUser`.
 */
class AdminUserSearch extends AdminUser
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'role', 'status', /*'login_at', 'created_at', 'updated_at'*/], 'integer'],
            [['username', 'nickname', /*'auth_key', 'password_hash', 'password_reset_token',*/ 'email', 'login_ip','login_at','created_at','updated_at'], 'safe'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = AdminUser::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            //分页
            'pagination'=>['pageSize'=>10],
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'role' => $this->role,
            'status' => $this->status,
            //'login_at' => $this->login_at,
            'login_ip' => $this->login_ip, 
            //'created_at' => $this->created_at,
            //'updated_at' => $this->updated_at,
        ]);

        $query->andFilterWhere(['like', 'username', $this->username])
            ->andFilterWhere(['like', 'nickname', $this->nickname]) 
            //->andFilterWhere(['like', 'auth_key', $this->auth_key])
            //->andFilterWhere(['like', 'password_hash', $this->password_hash])
            //->andFilterWhere(['like', 'password_reset_token', $this->password_reset_token])
            ->andFilterWhere(['like', 'email', $this->email])
            ->andFilterWhere(['like', 'login_ip', $this->login_ip]);
        
        if($this->login_at){
            $query->andFilterWhere(['between', 'login_at', strtotime($this->login_at),strtotime($this->login_at) + 86400 - 1]);
        }
        if($this->created_at){
            $query->andFilterWhere(['between', 'created_at', strtotime($this->created_at),strtotime($this->created_at) + 86400 - 1]);
        }
        if($this->updated_at){
            $query->andFilterWhere(['between', 'updated_at', strtotime($this->updated_at),strtotime($this->updated_at) + 86400 - 1]);
        }

        return $dataProvider;
    }
}
