<?php

namespace api\models;

use Yii;

/**
 * This is the model class for table "{{%place}}".
 *
 * @property string $id
 * @property string $pid
 * @property string $path
 * @property string $level
 * @property string $name
 * @property string $name_en
 * @property string $name_pinyin
 * @property string $code
 */
class Place extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%place}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'level'], 'integer'],
            [['path', 'name', 'name_en', 'name_pinyin'], 'string', 'max' => 255],
            [['code'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pid' => 'Pid',
            'path' => 'Path',
            'level' => 'Level',
            'name' => 'Name',
            'name_en' => 'Name En',
            'name_pinyin' => 'Name Pinyin',
            'code' => 'Code',
        ];
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getState()
    {
        return $this->hasOne(Place::className(), ['id' => 'pid']);
    }
    
    /**
     * @return \yii\db\ActiveQuery
     */
    public function getCountry()
    {
        return $this->hasOne(Place::className(), ['id' => 'pid']);
    }
}
