<?php

namespace api\models;

use Yii;

/**
 * This is the model class for table "sp_good_image".
 *
 * @property integer $id
 * @property integer $good_id
 * @property string $image_url
 *
 * @property Good $good
 */
class GoodImage extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%good_image}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['good_id', 'image_url'], 'required'],
            [['good_id'], 'integer'],
            [['image_url'], 'string', 'max' => 5000],
            [['good_id'], 'exist', 'skipOnError' => true, 'targetClass' => Good::className(), 'targetAttribute' => ['good_id' => 'id']],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'good_id' => 'Good ID',
            'image_url' => 'Image Url',
        ];
    }

    /**
     * @return \yii\db\ActiveQuery
     */
    public function getGood()
    {
        return $this->hasOne(Good::className(), ['id' => 'good_id']);
    }
}
